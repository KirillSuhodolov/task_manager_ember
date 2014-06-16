`import resolver from 'appkit/tests/helpers/resolver'`

isolatedContainer = (fullNames) ->
  container = new Ember.Container()
  container.optionsForType "component",
    singleton: false

  container.optionsForType "view",
    singleton: false

  container.optionsForType "template",
    instantiate: false

  container.optionsForType "helper",
    instantiate: false

  i = fullNames.length

  while i > 0
    fullName = fullNames[i - 1]
    container.register fullName, resolver.resolve(fullName)
    i--
  container

`export default isolatedContainer`