StateManager = Em.Mixin.create
  statusField: null
  statusesField: null

  init: () ->
    @_super()
    statusesField = @get('statusesField')
    statusField = @get('statusField')
    @set statusesField, @get("constructor.#{statusesField}")

    computingFunction = () ->
      @get(statusField) is @get("#{statusesField}.lastObject")

    Ember.defineProperty(@, 'isFinishState', Em.computed.apply(@, ["#{statusesField}.[]", statusField, computingFunction]))

    computingFunction = () ->
      unless @get('isFinishState')
        statuses = @get(statusesField)
        currentStatus = @get(statusField)
        statuses[statuses.indexOf(currentStatus) + 1]

    Ember.defineProperty(@, 'nextStatus', Em.computed.apply(@, ["#{statusesField}.[]", statusField, computingFunction]))

  transitionToNextState: ()->
    Em.assert('Model is already in the final state!', !@get('isFinishState'))
    @set(@get('statusField'), @get('nextStatus'))
    @save()

  setFirstState: (->
    @get('constructor').metaForProperty(@get('statusField')).options.defaultValue = @get("#{@get('statusesField')}.firstObject")
  ).on 'init'

`export default StateManager`