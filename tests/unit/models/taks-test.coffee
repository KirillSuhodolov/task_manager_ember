`import { test , moduleForModel } from 'appkit/tests/helpers/module-for'`

moduleForModel "task", "Unit - Task"

test "has init state", ->
  task = @subject()
  statuses = task.statuses
  equal task.get('status'), statuses.get('firstObject')

test "check for finish state", ->
  task = @subject()
  Em.run () ->
    statuses = task.statuses
    task.set 'status', statuses.get('lastObject')
    ok task.get('isFinishState')
