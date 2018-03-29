local helpers = require('test.functional.helpers')(after_each)
local Screen = require('test.functional.ui.screen')
local clear, feed, source = helpers.clear, helpers.feed, helpers.source
local command = helpers.command


describe("CTRL-Z Actions", function()
  local screen

  before_each(function()
    screen = Screen.new(52, 6)
    screen:attach()
  end)

  it("suspends nvim", function()
      screen.suspended = false
      local function check()
        eq(true, screen.suspended)
      end
      feed('<c-z>')
      screen:expect(check)
  end)

end)
