Item = Em.ObjectController.extend
  needs: ['tasks']
  actions:
    transitionToNextState: () ->
      @get('content').transitionToNextState()

    delete: () ->
      @get('content').destroyRecord()
      @get('controllers.tasks').removeObject @

`export default Item`