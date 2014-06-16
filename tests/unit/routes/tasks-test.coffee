`import { test, moduleFor } from 'ember-qunit'`

`import Tasks from 'appkit/routes/tasks'`

moduleFor 'route:tasks', "Unit - TasksRoute"

test "it exists", () ->
  ok(@subject() instanceof Tasks)
