local path = require("plenary.path").path

local write_count = 0
local git_branch = ""
local status_line = ""

local last_name_results = nil

local function constrain_string(line, max_len, cut_on_end)
	if #line <= max_len then
		return line
	end

	if cut_on_end then
		return line:sub(max_len - 3) .. "..."
	end
	return "..." .. line:sub(max_len - 3)
end

local function split(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end

	local t = {}
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		table.insert(t, str)
	end
	return t
end

local function get_file_name()
	local name = vim.fn.bufname()

	if not name or name == "" then
		return "(no name)"
	end

	local name_parts = split(name, path.sep)
	local name_results = {}
	for idx = 1, #name_parts - 1 do
		table.insert(name_results, name_parts[idx]:sub(1, 1))
		table.insert(name_results, path.sep)
	end
	table.insert(name_results, name_parts[#name_parts])
	last_name_results = table.concat(name_results)
	return last_name_results
end

local function get_git_info(force)
	if force or not git_branch or git_branch == "" then
		git_branch = vim.fn["FugitiveHead"]()
		if not git_branch or git_branch == "" then
			git_branch = "(no git)"
		end
	end

	return git_branch
end

local function lsp_info()
	local warnings = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	local errors = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	local hints = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })

	return string.format("LSP: H %d W %d E %d", #hints, #warnings, #errors)
end

local function harpoon_status()
	local status = require("harpoon.mark").status()
	if status == "" then
		status = "N"
	end

	return string.format("H:%s", status)
end

local statusline = "%%-20.80(%s%%) | %%-30.60(%s%%) | %%-20.20(%s%%) | %%-6.6(%s%%)%%-30.70(%s%%)"
function StatusLine()
	return string.format(
		statusline,
		-- write_count,
		constrain_string(get_file_name(), 80, false),
		get_git_info(),
		lsp_info(),
		harpoon_status(),
		status_line
	)
end

vim.o.statusline = "%!v:lua.StatusLine()"

local M = {}

M.on_write = function()
	write_count = write_count + 1
end

M.set_write = function(count)
	write_count = count
end

M.set_status = function(line)
	status_line = line
end

return M
