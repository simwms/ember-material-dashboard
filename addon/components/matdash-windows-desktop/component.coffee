`import Ember from 'ember'`
`import layout from './template'`

{inject: {service}, A, computed, run} = Ember

MatdashWindowsDesktopComponent = Ember.Component.extend
  classNames: ["matdash-windows-desktop"]
  layout: layout
  paramsRelay: service()
  desktopIcons: A []
  dwm: service "matdash-windows-desktop"
  registerDesktopIcon: (icon) ->
    @get "desktopIcons"
    .pushObject icon
  unregisterDesktopIcon: (icon) ->
    @get "desktopIcons"
    .removeObject icon

  didInsertElement: ->
    run.later => @get("dwm").register @

  willDestroyElement: ->
    @get("dwm").unregister @

  dimensions: ->
    width: @$().width() 
    height: @$().height()

`export default MatdashWindowsDesktopComponent`
