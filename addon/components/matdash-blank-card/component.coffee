`import Ember from 'ember'`
`import layout from './template'`

MatdashBlankCardComponent = Ember.Component.extend
  layout: layout
  classNames: ['matdash-blank-card', 'mdl-cell','mdl-cell--12-col','mdl-cell--12-col-tablet','mdl-cell--12-col-phone']
  imgSrc: "assets/images/empty-truck.png"

`export default MatdashBlankCardComponent`
