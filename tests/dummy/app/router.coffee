`import Ember from 'ember'`
`import config from './config/environment'`
`import {DSL} from 'autox'`
PolymorphicRoutes = ["cell", "dock", "scale"]

{String: {pluralize}} = Ember
Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  {namespace, children, child, collection, model, view, form} = DSL.import @
  @route "register"
  @route "signin"
  namespace "ember-assets", ->
    view "install"
    view "reqs"
    view "layout"
    view "icon"
    view "minicard"
    view "desktop"

  namespace "dashboard", ->
    collection "accounts", ->
      form "new"
    view "employers"
    view "employees"

    namespace "warehouse", ->
      model "appointment", ->
        form "edit"
        children "out-batches", as: "batch"
        children "in-batches", as: "batch", ->
          form "new"
        collection "histories"
      collection "appointments", ->
        form "new"
        view "search"
        collection "companies", ->
          form "new"

      model "batch", ->
        form "edit"
        children "histories"
        children "pictures", ->
          form "new"
      collection "batches"

      model "cell", ->
        form "edit"
        children "batches"
        children "histories"
      collection "cells"

      model "dock"
      collection "docks"

      model "employee"
      collection "employees"

      model "scale"
      collection "scales"

      model "truck", ->
        form "edit"
        children "histories"
      collection "trucks"

      model "weighticket", ->
        form "edit"

      namespace "admin", ->
        model "account", ->
          form "upgrade"
          form "danger"

        model "service-plan"
        
        model "employee", ->
          form "edit"
          view "terminate"
        collection "employees", ->
          form "new"

        for tile in PolymorphicRoutes
          collection pluralize(tile), ->
            model tile, -> form "edit"
        namespace "build", ->
          for tile in PolymorphicRoutes
            collection pluralize(tile), -> form "new"

`export {Router, PolymorphicRoutes}`
`export default Router`
