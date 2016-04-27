`import Ember from 'ember'`

DashboardEmployersRoute = Ember.Route.extend
  model: ->
    @modelFor "dashboard"
    .get "employees"
    .then (employees) ->
      employees.rejectBy "role", "superadmin"

`export default DashboardEmployersRoute`
