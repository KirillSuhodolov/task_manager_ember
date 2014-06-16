helper = Ember.Handlebars.makeBoundHelper (word) ->
  word.underscore().split('_').join(' ').capitalize()

`export default helper`