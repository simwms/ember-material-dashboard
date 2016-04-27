`import Ember from 'ember'`

Route = Ember.Route.extend
  beforeModel: ->
    if @xession.get("loggedIn")
      @transitionTo "dashboard"
  model: ->
    @store.createRecord "user"

  actions:
    register: (user) ->
      user.save()
      .then =>
        @xession.login user.getProperties("email", "password")
      .then =>
        @notify.success "Success! You've been registered"
        @transitionTo "user"

`export default Route`