`import Ember from 'ember'`
`import AutosubscribeMixin from 'ember-query-params/mixins/autosubscribe'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`
`import {processMacro} from 'dummy/utils/process-query'`

{RSVP, inject: {service}} = Ember
WarehouseRoute = Ember.Route.extend AutosubscribeMixin, AuthenticatedRouteMixin,
  socket: service "socket"
  warehouseLoggedIn: ->
    @xession.get("loggedIn") and @xession.get("authData.data.relationships.account.data.id")?
  beforeModel: ->
    switch 
      when @warehouseLoggedIn() then @get("socket").connect()
      when @xession.get("loggedIn") then @transitionTo "user"
      else @_super arguments...

  model: ->
    RSVP.hash
      account: @xession.get("model.account")
      scales: @store.findAll "scale"
      docks: @store.findAll "dock"
      appointments: @store.query "appointment", processMacro("live")
      trucks: @store.query "truck", processMacro("live")
      batches: @store.query "batch", processMacro("live")

  afterModel: ({account}) ->
    @_super arguments...
    @activeServicePlan.set "account", account
    @xession.connect "account"

  actions:
    refresh: ->
      @refresh()

`export default WarehouseRoute`