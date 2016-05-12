`import Ember from 'ember'`
`import layout from './template'`
{computed} = Ember

MaIconComponent = Ember.Component.extend
  layout: layout
  tagName: "span" 
  classNames: ["matdash-icon"]
  classNameBindings: ["badgeClass", "colorClass"]
  attributeBindings: ["badge:data-badge"]
  ariaRole: "presentation"

  badgeClass: computed "badge", ->
    if @get("badge") > 0 then "mdl-badge" else ""
  iconType: computed "iconName", ->
    name = @getWithDefault("iconName", "").trim()
    switch
      when name.match /\.(png|jpg|jpeg|gif|ico|bmp)$/ then "img"
      when name.match /^fa-/ then "awesome"
      else "material"
  colorClass: computed "color", ->
    if (color = @get "color")?
      "mdl-color-text--#{color}"
    else
      ""

MaIconComponent.reopenClass
  positionalParams: ["iconName"]

`export default MaIconComponent`
