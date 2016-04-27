`import Ember from 'ember'`
`import layout from './template'`

{computed: {filterBy, alias, setDiff}, inject: {service}} = Ember

DummyCollectionComponent = Ember.Component.extend
  layout: layout
  classNames: ["dummy-collection"]
  fields: alias "meta.fields"
  modelPath: alias "meta.modelPath"
  routing: service("-routing")

  otherFields: setDiff "fields", "aboutFields"
  displayableFields: filterBy "otherFields", "canDisplay"
  aboutFields: filterBy "fields", "name", "id"
  aboutField: alias "aboutFields.firstObject"

  transitionTo: (modelPath, models...) ->
    @get("routing").transitionTo modelPath, models
`export default DummyCollectionComponent`
