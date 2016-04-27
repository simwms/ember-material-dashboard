`import Ember from 'ember'`
`import layout from './template'`
`import {AutoxActionFieldCore} from 'autox/components/autox-show-action-field'`
`import UserCustomize from 'autox/mixins/user-customize'`

{computed} = Ember
{or: firstPresent} = computed

DummyShowActionFieldComponent = Ember.Component.extend UserCustomize, AutoxActionFieldCore,
  tagName: "button"
  layout: layout
  customPrefix: "show-for-action-field"
  classNames: ["dummy-show-action-field"]
  defaultIconName: "open_in_browser"
  iconName: firstPresent "field.icon", "defaultIconName"
  attributeBindings: ["field.name:aria-label", "disabled"]
  classNameBindings: ["isBusy:disabled:", "canDisplay::hidden"]

`export default DummyShowActionFieldComponent`
