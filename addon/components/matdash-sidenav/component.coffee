`import Ember from 'ember'`
`import layout from './template'`
{computed: {alias}} = Ember
MatdashSidenavComponent = Ember.Component.extend
  layout: layout
  classNames: ["matdash-sidenav", "mdl-layout__drawer", "mdl-color--blue-grey-900", "mdl-color-text--blue-grey-50"]
  linkClass: alias "matdash.sidenav.linkClass"
  iconColor: alias "matdash.sidenav.iconColor"
`export default MatdashSidenavComponent`
