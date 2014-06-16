NewController = Em.ObjectController.extend
  init: ()->
    @_super()
    @resetModel()

  actions:
    create: () ->
      @get('model').save().then ()=>
        @resetModel()

  resetModel: () ->
    @set 'model', @store.createRecord('task')


`export default NewController`
