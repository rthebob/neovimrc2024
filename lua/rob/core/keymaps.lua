-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<ESC>", ":nohl<CR>", { desc = "Clear search highlights" })

-- save when pressing ss
keymap.set("n", "ss", ":w<CR>", { desc = "Save when pressing ss" })

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- quit all
keymap.set("n", "<leader>qq", ":qa<CR>", { desc = "Quit all" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "=", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Move lines
keymap.set("n", "<A-j>", ":m +1<CR>", {}) -- moves down 1 line
keymap.set("n", "<A-Down>", ":m +1<CR>", {}) -- moves down 1 line
keymap.set("n", "<A-k>", ":m -2<CR>", {}) -- moves up 1 line
keymap.set("n", "<A-Up>", ":m -2<CR>", {}) -- moves up 1 line
keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv") -- moves up block of code
keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv") -- moves down block of code
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- moves up block of code
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- moves down block of code

-- Down Up movement
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Toggle virtual_text diagnostic
keymap.set("n", "tt", function()
	local current_config = vim.diagnostic.config()
	if current_config then
		current_config.virtual_text = not current_config.virtual_text
		vim.diagnostic.config(current_config)
	else
		vim.notify("No diagnostic config found. Setting a default one.", vim.log.levels.INFO)
		vim.diagnostic.config({
			virtual_text = true,
		})
	end
end)

-- Undo tree
keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")

local mapCopilot = keymap.set
mapCopilot("i", "<C-i>", 'copilot#Accept("<CR>")', { silent = true, expr = true, replace_keycodes = false })
mapCopilot("i", "<C-K>", "copilot#Cancel()", { silent = true, expr = true, replace_keycodes = false })
mapCopilot("i", "<C-L>", "copilot#Next()", { silent = true, expr = true, replace_keycodes = false })
mapCopilot("i", "<C-H>", "copilot#Previous()", { silent = true, expr = true, replace_keycodes = false })

-- Replace word under cursor
keymap.set(
	"n",
	"gs",
	[[:let @/='\<'.expand('<cword>').'\>'<CR>:set hls<CR>cgn]],
	{ desc = "Replace word under cursor" }
)
