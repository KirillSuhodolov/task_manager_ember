App = undefined
module "Acceptances - Tasks",
  setup: ->
    App = startApp()

test "delete all task", () ->
  visit("/").click('.destroy-all').then () ->
    ok !find('.panel').length