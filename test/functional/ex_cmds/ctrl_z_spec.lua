local helpers = require('test.functional.helpers')(after_each)
local Screen = require('test.functional.ui.screen')
local clear, feed, spawn, set_session, eq = helpers.clear, helpers.feed, helpers.spawn, helpers.set_session, helpers.eq
local command = helpers.command


describe("CTRL-Z Actions", function()
  local screen
  local nvim_argv = {helpers.nvim_prog, '-u', 'NONE', '-i', 'NONE', '-N', '--embed'}

  before_each(function()
    clear()
    local screen_nvim = spawn(nvim_argv)
    set_session(screen_nvim)
    screen = Screen.new(52, 6)
    screen:attach()
  end)

  it("suspends nvim", function()
      screen.suspended = false
      local function check()
        eq(true, screen.suspended)
      end
      feed('<c-z>')
      -- custom feed
      -- if c-z is recieved, it should directly call SIGSTOP
      screen:expect(check)
  end)

end)
