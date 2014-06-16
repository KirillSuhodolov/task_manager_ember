`import Task from 'appkit/models/task'`

TasksController = Em.ArrayController.extend
  filteredTaskNames: []
  itemController: 'tasks/item'

  init: ()->
    @_super()
    Task.statuses.forEach (status) =>
      computingFunction = () ->
        @filter (task)->
          task.get('status') is status and !task.get('isNew')

      propertyName = "#{status}Tasks"
      @filteredTaskNames.addObject propertyName
      Ember.defineProperty(@, propertyName, Em.computed.apply(@, ['content.@each.status', status, computingFunction]))

  actions:
    destroyAll: ()->
      @filterBy('isNew', false).forEach (item) =>
        item.get('model').destroyRecord()
        @removeObject item

`export default TasksController`