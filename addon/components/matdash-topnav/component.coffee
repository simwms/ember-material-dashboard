`import Ember from 'ember'`
`import layout from './template'`

MatdashTopnavComponent = Ember.Component.extend
  layout: layout
  classNames: ["matdash-topnav", "mdl-layout__header", "mdl-color--grey-100", "mdl-color-text--grey-600"]
  tagName: "header"

`export default MatdashTopnavComponent`
