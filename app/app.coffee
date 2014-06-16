`import Resolver from 'ember/resolver'`

`import loadInitializers from 'ember/load-initializers'`

App = Ember.Application.extend
    modulePrefix: 'appkit'
    Resolver: Resolver

loadInitializers(App, 'appkit')

`export default App`

