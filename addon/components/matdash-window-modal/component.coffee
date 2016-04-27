`import Ember from 'ember'`
`import layout from './template'`
`import _s from 'lodash/string'`

{endsWith, startsWith} = _s
{computed, run, A, String, typeOf, inject: {service}} = Ember
{alias, reads} = computed
delta = ({offsetX: xf, offsetY: yf}, {offsetX: x0, offsetY: y0}) ->
  deltaX: xf - x0
  deltaY: yf - y0

deltaP = ({pageX: xf, pageY: yf}, {pageX: x0, pageY: y0}) ->
  deltaX: xf - x0
  deltaY: yf - y0

inside = (min, value, max) ->
  switch
    when min < value < max then value
    when value < min then min
    when max < value then max
    else value

MatdashWindowModalComponent = Ember.Component.extend
  layout: layout
  classNames: ["matdash-window-modal"]
  attributeBindings: ["style"]
  tabClass: "mdl-button mdl-js-button mdl-button--icon mdl-button--colored"
  cardMode: "standard"
  dwm: service "matdash-windows-desktop" 
  cardHeight: reads "dwm.defaultHeight"
  cardWidth: reads "dwm.defaultWidth"
  cardTop: 0
  cardLeft: 0
  maxWidth: alias "dwm.maxWidth"
  maxHeight: alias "dwm.maxHeight"
  isMaximized: computed "maxWidth", "maxHeight", "cardWidth", "cardHeight", ->
    {maxWidth, maxHeight, cardWidth, cardHeight} = @getProperties "maxWidth", "maxHeight", "cardWidth", "cardHeight"
    maxWidth <= cardWidth and maxHeight <= cardHeight

  windowsIcons: A []

  registerIcon: (icon) ->
    @windowsIcons.pushObject icon
  unregisterIcon: (icon) ->
    @windowsIcons.removeObject icon

  style: computed "cardHeight", "cardWidth", "cardTop", "cardLeft", ->
    {cardHeight, cardWidth, cardTop, cardLeft} = @getProperties "cardHeight", "cardWidth", "cardTop", "cardLeft"
    String.htmlSafe """
    height: #{cardHeight}px; width: #{cardWidth}px; top: #{cardTop}px; left: #{cardLeft}px;
    """
  incrementPropertyWithin: (field, amount, floor, roof) ->
    expectedValue = @getWithDefault(field, 0) + amount
    floorValue = if typeOf(floor) is "number" then floor else @get floor
    roofValue = if typeOf(roof) is "number" then roof else @get roof
    switch
      when expectedValue < floorValue then @set field, floorValue
      when floorValue < roofValue then @set field, roofValue
      else @set field, expectedValue
  enterResizeMode: (dir) ->
    @set "cardMode", "resize"
    @set "resizeDirection", dir
    @set "resizeAnchor", null
  exitResizeMode: Ember.on "mouseUp", "mouseLeave", ->
    return unless @get("cardMode") is "resize"
    {cardWidth: width, cardHeight: height} = @getProperties "cardWidth", "cardHeight"
    @get("dwm").updateDefaults {width, height}
    @set "cardMode", "standard"
    @set "resizeAnchor", null
    @set "resizeDirection", null
  enterDragMode: ->
    @set "cardMode", "drag"
    @set "dragAnchor", null
    @$(".matdash-window-modal__title").on "mousemove", @dragWindow.bind(@)
  exitDragMode: ->
    @set "cardMode", "standard"
    @set "dragAnchor", null
    @$(".matdash-window-modal__title").off "mousemove"

  resizeWindow: Ember.on "mouseMove", (e) ->
    return if @get("cardMode") isnt "resize"
    return @exitResizeMode() unless e.buttons > 0 and e.button is 0
    if (anchor = @get "resizeAnchor")? and (dir = @get "resizeDirection")?
      {deltaX, deltaY} = delta e, anchor
      @incrementPropertyWithin "cardWidth", deltaX, "minWidth", "maxWidth" if endsWith dir, "east"
      @incrementPropertyWithin "cardHeight", deltaY, "minWidth", "maxHeight" if startsWith dir, "south"
    else
      @set "resizeAnchor", e

  dragWindow: (e) ->
    if (anchor = @get "dragAnchor")?
      {deltaX, deltaY} = delta e, anchor
      @incrementPropertyWithin "cardLeft", deltaX, 0
      @incrementPropertyWithin "cardTop", deltaY, 0
    else
      @set "dragAnchor", e

  actions:
    minimize: ->
      @setProperties if @get("dwm").defaultsAreMax()
        cardWidth: @get("dwm.minWidth")
        cardHeight: @get("dwm.minHeight")
      else
        cardWidth: @get("dwm.defaultWidth")
        cardHeight: @get("dwm.defaultHeight")
    maximize: ->
      @exitResizeMode @enterResizeMode "southeast" # remembers old defaults
      {maxWidth: cardWidth, maxHeight: cardHeight} = @getProperties "maxWidth", "maxHeight"
      @setProperties {cardWidth, cardHeight} if cardWidth? and cardHeight?
    close: ->
      @sendAction "close"

`export default MatdashWindowModalComponent`
