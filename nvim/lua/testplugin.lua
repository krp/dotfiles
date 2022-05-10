local plugin = "My Test Plugin"
local async = require("plenary.async")
local notify = require("notify").async

async.run(function()
  notify("Some error!", "error")
  notify("Let's wait for this to close").events.close()
  notify("It closed!")
end)



