`import Ember from 'ember'`

DashboardEmployeesRoute = Ember.Route.extend
  model: ->
    @modelFor "dashboard"
    .get "employees"
    .then (employees) ->
      employees.filterBy "role", "superadmin"

`export default DashboardEmployeesRoute`
