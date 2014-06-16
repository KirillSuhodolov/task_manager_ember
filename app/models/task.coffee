`import StateManager from 'appkit/mixins/state_manager'`

Task = DS.Model.extend StateManager,
  title: DS.attr('string')
  description: DS.attr('string')
  status: DS.attr('string')

  statusField: 'status'
  statusesField: 'statuses'

Task.reopenClass
  statuses: ['waiting', 'inProcess', 'completed']

`export default Task`
