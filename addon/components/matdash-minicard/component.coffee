`import Ember from 'ember'`
`import layout from './template'`

MatdashMinicardComponent = Ember.Component.extend
  layout: layout
  classNames: ['matdash-minicard','mdl-cell', 'mdl-cell--1-col','mdl-cell--2-col-tablet','mdl-cell--4-col-phone']
  src: "images/doge.png"
  cardBackType: "folder"
  title: "card title"

`export default MatdashMinicardComponent`
