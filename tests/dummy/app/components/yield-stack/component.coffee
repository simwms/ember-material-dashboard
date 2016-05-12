`import Ember from 'ember'`
`import layout from './template'`
{inject: {service}, computed: {alias}} = Ember
YieldStackComponent = Ember.Component.extend
  tagName: ""
  layout: layout
  routing: service "-routing"
  
  init: ->
    @_super arguments...
    @set "routeName", @get "routing.currentRouteName"

  didInsertElement: ->
    {routeName, payload} = @getProperties "routeName", "payload"
    @yieldStack.append routeName, payload

  willDestroyElement: ->
    @yieldStack.remove()

`export default YieldStackComponent`
