function ColorMyPencils(color)
  color = color or "kanagawa-wave"
  vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "Normalfloat", { bg = "none" })
  
end
return {

	  {
    "rebelot/Kanagawa.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      require('kanagawa').setup({
        disable_background = true,
      })
      
      vim.cmd("colorscheme kanagawa-wave")

      ColorMyPencils()
    end,
  },
}
