`import Ember from 'ember'`
`import layout from './template'`

MatdashContentComponent = Ember.Component.extend
  layout: layout
  classNames: ["matdash-content", "mdl-layout__content", "mdl-color--grey-100"]
  tagName: "main"

`export default MatdashContentComponent`
