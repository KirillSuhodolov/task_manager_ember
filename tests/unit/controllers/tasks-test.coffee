`import { test, moduleFor } from 'ember-qunit'`

`import Task from 'appkit/models/task'`

moduleFor 'controller:tasks', "Unit - TasksController",
  needs: ['controller:tasks/item']

test "separate content by statuses", () ->
  ctrl = @subject()
  Em.run () ->
    ok Task.statuses.every (status) -> ctrl.get "#{status}Tasks"

test "filteredTaskNames equal status length", () ->
  ctrl = @subject()
  equal ctrl.get('filteredTaskNames.length'), Task.statuses.length

test "delete all tasks", () ->
  ctrl = @subject()

  Em.run () ->
    ctrl.set('content', [])
    ctrl.send 'destroyAll'
    ok Ember.isEmpty(ctrl.get('content'))