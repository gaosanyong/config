return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  vision = "*", -- use for stability : omit to use `main` branch for the latest feature
  config = true,
  -- ys iw " : add double quote to word
  -- ds "    : remove double quote from word 
  -- cs " '  : replace double quote by single quote
}
