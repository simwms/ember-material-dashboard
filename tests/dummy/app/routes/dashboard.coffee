`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

DashboardRoute = Ember.Route.extend AuthenticatedRouteMixin,
  model: ->
    @xession
    .get "model"
    .get "user"
    .catch =>
      @xession.logout()
      @notify.alert "Your session cookie was invalid, please login again"
      @transitionTo "signin"

`export default DashboardRoute`