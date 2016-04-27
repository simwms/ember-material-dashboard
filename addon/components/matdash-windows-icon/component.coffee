`import Ember from 'ember'`
`import Component from '../matdash-minicard/component'`
`import layout from './template'`

MatdashWindowsIconComponent = Component.extend
  layout: layout
  classNames: ["matdash-windows-icon"]
  didInitAttrs: ->
    @get "windows"
    ?.register @

  willDestroyElement: ->
    @get "windows"
    ?.unregister @

`export default MatdashWindowsIconComponent`
