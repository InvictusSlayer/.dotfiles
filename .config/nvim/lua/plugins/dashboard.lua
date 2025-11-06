local header = [[
                                      ..                               
         .xHL           ..          dF                                 
      .-`8MMMhxxx~     @L          'MMbu.         .u    .              
   .HMX  `%MM8*"      9MM8i   .dL  '*MMMMMbu    .dMMB :@Mc        u    
   8MMX     ..x..     `YMMMk:*MMM.   ^"*MMMMN  ="MMMMfMMMMr    us8M8u. 
  'MMMMk .x8MMMMM8x     MMME  8MMI  beWE "MMML   4MMM>'M8"  .@MM "MMMM"
   ?MMMMX    "MMMMMX    8MME  8MMI  8MME  8MME   4MMM> '    9MM8  9MM8 
    ?MMMMX    'MMMMM>   8MME  8MMI  8MME  8MME   4MMM>      9MM8  9MM8 
 HMH %MMM8     `MMMM>   MMME  8MMI  8MME  8MMF  .dMMML .+   9MM8  9MM8 
'MMM> MM8"      8MM8   xMMMN><MMM' .MMMN..MM8   ^"8MMM*"    9MMM  9MMM 
 "8` .8" ..     8M*     "88"  8MM   `"8MM*""       "Y"      "MMM*""MMM"
    `  x8888h. d*"            MMF      ""                    ^Y"   ^Y' 
      !""*888%~              98"                                       
      !   `"  .            ./"                                         
      '-....:~            ~`                                           
]] --[[
      ...                         .                                                           
   xHM8"`~ .x8X      .uef^"      @M8>                                                         
 :MMM8   .f"8MMMHf :dMME         %MP      ..    .     :                  .u    .              
:MMMM>  XML  ^""`  `MMME          .     .8MM: x8M8  x8M8.       .u     .dMMB :@Mc        u    
XMMM8  XMMMh        8MME .z8k   .@M8u  ~`MMMM~'MMMX`?MMMf`   udMMM8.  ="MMMMfMMMMr    us8M8u. 
MMMM8  !MMMM8.      8MME~?MMML ''MMME`   XMM8  8MMX 'MMM>  :8MM'MMM8.   4MMM>'M8"  .@MM "MMMM"
MMMM8   %MMMM8      8MME  8MME   8MME    XMM8  8MMX 'MMM>  dMM8 'MM%"   4MMM> '    9MM8  9MM8 
8MMM8 '> `MMMM>     8MME  8MME   8MME    XMM8  8MMX 'MMM>  MMM8.+"      4MMM>      9MM8  9MM8 
`8MMML %  ?MM8   !  8MME  8MME   8MME    XMM8  8MMX 'MMM>  8MMML       .dMMML .+   9MM8  9MM8 
 `8MMM  `-*""   /   MMME  8MME   8MM&   "*MM%""*M8" 'MMM!` 'MMMMc. .+  ^"8MMM*"    9MMM  9MMM 
   "8M8.      :"   mMMMN= 8MM>   RMM8"    `~    "    `"`    "8MMMM%       "Y"      "MMM*""MMM"
     `""***~"`      `Y"   MMM     ""                          "YP'                  ^Y"   ^Y' 
                         JM8"                                                                 
                         @%                                                                   
]] --[[
  _,, ,  ___, , ,  _,,_  _
 /  |_|,' |  |\/| /_,|_)'|\
'\_'| |  _|_,| `|'\_'| \ |-\
   `' ` '    '  `   `'  `'  `
]]


return {
    "folke/snacks.nvim",
    optional = true,
    opts = {
        dashboard = {
            width = 50,
            preset = {
                header = header,
                -- stylua: ignore
                ---@type snacks.dashboard.Item[]
                keys = {
                    { icon = " ", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')", key = "f" },
                    { icon = " ", desc = "New File", action = ":ene | startinsert", key = "n" },
                    ---@diagnostic disable-next-line: missing-fields
                    { icon = " ", desc = "Ranger", action = function() require("ranger-nvim").open(true) end, key = "e" },
                    { icon = " ", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')", key = "r" },
                    { icon = " ", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')", key = "g" },
                    { icon = " ", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})", key = "c" },
                    { icon = "󰦛 ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = "󰁯 ", action = function() require("persistence").load({ last = true }) end, desc = "Restore Last Session", key = "S" },
                    { icon = " ", desc = "Lazy Extras", action = ":LazyExtras", key = "x" },
                    { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
        },
    },
}
