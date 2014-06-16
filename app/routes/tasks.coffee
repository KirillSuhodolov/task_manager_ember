TasksRoute = Em.Route.extend
  model: ()->
    @store.findAll('task')

`export default TasksRoute`