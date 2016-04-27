`import Ember from 'ember'`
`import layout from './template'`

MatdashSidenavLinkComponent = Ember.LinkComponent.extend
  layout: layout
  classNames: ["matdash-sidenav-link"]
  classNameBindings: ["matdash.sidenav.linkClass"]

`export default MatdashSidenavLinkComponent`
