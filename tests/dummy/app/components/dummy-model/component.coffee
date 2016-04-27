`import Ember from 'ember'`
`import layout from './template'`

{isPresent, computed, inject: {service}} = Ember
{filterBy, alias, setDiff} = computed

DummyModelComponent = Ember.Component.extend
  layout: layout
  classNames: ["dummy-model"]
  cardsPerRow: 1
  routing: service("-routing")
  fields: alias "meta.fields"
  aboutFields: filterBy "fields", "name", "id"
  aboutField: alias "aboutFields.firstObject"

  otherFields: setDiff "fields", "aboutFields"

  displayableFields: filterBy "otherFields", "canDisplay"
  
  actionFields: filterBy "displayableFields", "isAction"
  linkFields: filterBy "displayableFields", "isLink"

  notActionFields: setDiff "displayableFields", "actionFields"
  infoFields: setDiff "notActionFields", "linkFields"

  transitionTo: (modelPath, models...) ->
    @get("routing").transitionTo modelPath, models

  maybeGotoModel: (field) ->
    path = field.get "linkSlug.path"
    name = field.get "name"
    model = @get "model"
    switch field.get "linkSlug.type"
      when "hasManyChildren", "belongsToChild"
        @transitionTo path, model
      when "belongsTo"
        @transitionTo path, model.get("#{name}.id")
      when "hasMany"
        @transitionTo path

`export default DummyModelComponent`
