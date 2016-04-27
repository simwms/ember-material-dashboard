`import Ember from 'ember'`

{computed, A, inject: {service}} = Ember
{alias, or: firstPresent} = computed

MatdashWindowsDesktopService = Ember.Service.extend
  matdashEnvironment: service()
  activeDesktop: alias "desktops.firstObject"
  desktops: A []
  defaultWidth: firstPresent "maxWidth", "minWidth"
  defaultHeight: firstPresent "maxHeight", "minHeight"
  maxHeight: alias "maxDimensions.height"
  maxWidth: alias "maxDimensions.width"
  minWidth: alias "matdashEnvironment.windows.minWidth"
  minHeight: alias "matdashEnvironment.windows.minHeight"
  
  maxDimensions: computed "activeDesktop", "browserWindow", ->
    @get("activeDesktop")?.dimensions() ? {}

  register: (desktop) ->
    @desktops.unshiftObject desktop

  unregister: (desktop) ->
    @desktops.removeObject desktop

  init: ->
    @_super arguments...
    @boundResizeHandler = => 
      @notifyPropertyChange "browserWindow"
    window.addEventListener 'resize', @boundResizeHandler

  destroy: ->
    window.removeEventListener 'resize', @boundResizeHandler
    @_super arguments...

  updateDefaults: ({width, height}) ->
    @setProperties
      defaultWidth: width
      defaultHeight: height

  defaultsAreMax: ->
    @get("defaultWidth") >= @get("maxWidth") and @get("defaultHeight") >= @get("maxHeight")

`export default MatdashWindowsDesktopService`
