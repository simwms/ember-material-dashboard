`import Ember from 'ember'`

Route = Ember.Route.extend
  beforeModel: ->
    if @xession.get("loggedIn")
      @transitionTo "dashboard"
  model: ->
    @xession.get("model")

`export default Route`