`import ItemView from 'appkit/views/tasks/item'`

Collection = Em.CollectionView.extend
  itemViewClass: ItemView.extend({})
  selection: null

  init: () ->
    field = "controller.#{@get('selection')}"
    computingFunction = () ->
      @get field

    Ember.defineProperty(@, 'content', Em.computed.apply(@, ["#{field}.[]", 'selection', computingFunction]))
    @_super()

`export default Collection`