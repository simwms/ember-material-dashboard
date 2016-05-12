`import Ember from 'ember'`
{inject: {service}, computed: {alias}, A} = Ember
YieldStackService = Ember.Service.extend
  routing: service "-routing"
  routeNames: A []
  payloads: A []
  append: (routeNames, payload) ->
    @routeNames.pushObject routeNames
    @payloads.pushObject payload
  remove: ->
    @routeNames.popObject()
    @payloads.popObject()
  action:
    access: ->
      @payloads.get("lastObject")


`export default YieldStackService`
