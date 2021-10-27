local present1, gl = pcall(require, 'galaxyline')
if not present1 then
    print("galxyline not found")
    return
end

local gls = gl.section

gl.short_line_list = {
    'LuaTree',
    'vista',
    'dbui',
    'startify',
    'term',
    'nerdtree',
    'fugitive',
    'fugitiveblame',
    'plug'
}

-- VistaPlugin = extension.vista_nearest

local colors = {
    bg       = '#5C687A',
    line_bg  = '#16191D',
    fg       = '#8FBCBB',
    fg_2     = '#8EC07C',
    fg_green = '#65a380',
    yellow   = '#E5C07B',
    cyan     = '#70C0BA',
    darkblue = '#83A598',
    green    = '#98C379',
    orange   = '#FF8800',
    purple   = '#C678DD',
    magenta  = '#C858E9',
    blue     = '#73BA9F',
    red      = '#D54E53',
}

local use_coc = false
if vim.g.nerd_galaxyline_lsp == 'coc' then
    use_coc = true
end

local function has_file_type()
    local f_type = vim.bo.filetype
    if not f_type or f_type == '' then
        return false
    end
    return true
end

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

-- insert_left insert item at the left panel
local function insert_left(element)
  table.insert(gls.left, element)
end

-- insert_blank_line_at_left insert blank line with
-- line_bg color.
local function insert_blank_line_at_left()
insert_left {
  Space = {
    provider = function () return ' ' end,
    highlight = {colors.line_bg,colors.line_bg}
  }
}
end

-- insert_right insert given item into galaxyline.right
local function insert_right(element)
  table.insert(gls.right, element)
end

-- insert_blank_line_at_left insert blank line with
-- line_bg color.
local function insert_blank_line_at_right()
insert_right {
  Space = {
    provider = function () return ' ' end,
    highlight = {colors.line_bg,colors.line_bg}
  }
}
end

-----------------------------------------------------
----------------- start insert ----------------------
-----------------------------------------------------

--{ mode panel start
insert_left{
  Start = {
    provider = function() return ' ' end,
    highlight = {colors.line_bg,}
  }
}

insert_blank_line_at_left()

insert_left{
  ViMode = {
    icon = function()
        local icons = {
            n      = ' ',
            i      = ' ',
            c      = 'ﲵ ',
            V      = ' ',
            [''] = ' ',
            v      = ' ',
            C      = 'ﲵ ',
            R      = '﯒ ',
            t      = ' ',
        }
        return icons[vim.fn.mode()]
      end,
    provider = function()
      -- auto change color according the vim mode
      local alias = {
          n      = 'N',
          i      = 'I',
          c      = 'C',
          V      = 'VL',
          [''] = 'V',
          v      = 'V',
          C      = 'C',
          ['r?'] = ':CONFIRM',
          rm     = '--MORE',
          R      = 'R',
          Rv     = 'R&V',
          s      = 'S',
          S      = 'S',
          ['r']  = 'HIT-ENTER',
          [''] = 'SELECT',
          t      = 'T',
          ['!']  = 'SH',
      }
      local mode_color = {
        n = colors.yellow,      i = colors.green,   v=colors.blue,
        [''] = colors.blue,   V=colors.blue,      c = colors.magenta,
        no = colors.red,        s = colors.orange,  S=colors.orange,
        [''] = colors.orange, ic = colors.yellow, R = colors.purple,
        Rv = colors.purple,     cv = colors.red,    ce=colors.red,
        r = colors.cyan,        rm = colors.cyan,   ['r?'] = colors.cyan,
        ['!'] = colors.red,     t = colors.red
      }

      local vim_mode = vim.fn.mode()
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim_mode])
      return alias[vim_mode]
    end,
    highlight = {colors.line_bg, colors.line_bg},
  },
}

insert_blank_line_at_left()

insert_left{
  Separa = {
    provider = function() return ' ' end,
    highlight = {colors.line_bg, },
  }
}

--mode panel end}

-- {information panel start
insert_left{
  Start = {
    provider = function() return ' ' end,
    highlight = {colors.line_bg,}
  }
}

insert_left{
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.line_bg},
  },
}

insert_left{
  FileName = {
    provider = "FileName",
    condition = function() return buffer_not_empty and has_file_type() end,
    -- highlight = {colors.fg,colors.line_bg}
    highlight = {colors.fg_2,colors.line_bg}
  }
}


-- insert_blank_line_at_left()

-- insert_left{
--   Separa = {
--     provider = function() return ' ' end,
--     highlight = {colors.line_bg, },
--   }
-- }

-- insert_left{
--   Start = {
--     provider = function() return ' ' end,
--     highlight = {colors.line_bg,}
--   }
-- }

-- insert_left {
--   GitIcon = {
--     provider = function() return '  ' end,
--     condition = require('galaxyline.provider_vcs').check_git_workspace,
--     highlight = {colors.orange,colors.line_bg},
--   }
-- }

-- insert_left {
--   BranchName = {
--     provider = 'BranchName',
--     condition = require('galaxyline.provider_vcs').check_git_workspace,
--     -- highlight = {'#8FBCBB',colors.line_bg,'bold'},
--     highlight = {colors.fg_2,colors.line_bg,'bold'},
--   }
-- }

insert_blank_line_at_left()

insert_left{
  Separa = {
    provider = function() return ' ' end,
    highlight = {colors.line_bg, },
  }
}

--mode panel end}

-- {information panel start
insert_left{
  Start = {
    provider = function() return ' ' end,
    highlight = {colors.line_bg,}
  }
}

insert_left {
  GitIcon = {
    provider = function() return '  ' end,
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {colors.orange,colors.line_bg},
  }
}

insert_left {
  GitBranch = {
    provider = 'GitBranch',
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    -- highlight = {'#8FBCBB',colors.line_bg,'bold'},
    highlight = {colors.fg_2,colors.line_bg,'bold'},
  }
}

insert_blank_line_at_left()

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

insert_left {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = '  ',
    highlight = {colors.green,colors.line_bg},
  }
}

insert_blank_line_at_left()

-- insert_left{
--   Separa = {
--     provider = function() return ' ' end,
--     highlight = {colors.line_bg, },
--   }
-- }

--mode panel end}

-- {information panel start
-- insert_left{
--   Start = {
--     provider = function() return ' ' end,
--     highlight = {colors.line_bg,}
--   }
-- }

-- insert_left {
--   DiagnosticError = {
--     provider = 'DiagnosticError',
--     icon = '  ',
--     highlight = {colors.red,colors.line_bg}
--   }
-- }

-- insert_left {
--   DiagnosticWarn = {
--     provider = 'DiagnosticWarn',
--     icon = '  ',
--     highlight = {colors.yellow,colors.line_bg},
--   }
-- }

-- insert_left {
--     DiagnosticHint = {
--      provider = 'DiagnosticHint',
--      condition = function() return checkwidth() and not use_coc end,
--      highlight = {colors.white,colors.line_bg},
--      icon = '  ',
--     }
-- }

insert_left{
  Separa = {
    provider = function() return ' ' end,
    highlight = {colors.line_bg, },
  }
}
-- left information panel end}

insert_right{
  Start = {
    provider = function() return ' ' end,
    highlight = {colors.line_bg,}
  }
}

insert_blank_line_at_right()

insert_blank_line_at_right()

insert_right{
  LineInfo = {
    provider = 'LineColumn',
    separator = '',
    separator_highlight = {colors.green, colors.line_bg},
    highlight = {colors.fg,colors.line_bg},
        condition = checkwidth,
  },
}

insert_right{
  PerCent = {
    provider = 'LinePercent',
    separator = '',
    separator_highlight = {colors.blue,colors.line_bg},
    highlight = {colors.cyan, colors.line_bg,'bold'},
        condition = checkwidth,
  }
}

insert_blank_line_at_right()

insert_right{
  Separa = {
    provider = function() return ' ' end,
    highlight = {colors.line_bg, },
  }
}