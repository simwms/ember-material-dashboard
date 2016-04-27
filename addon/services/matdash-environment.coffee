`import Ember from 'ember'`

MatdashEnvironmentService = Ember.Service.extend
  sidenav:
    linkClass: "mdl-navigation__link"
    iconColor: "blue-grey-400"
    dividerClass: "mdl-layout-spacer"
  windows:
    minWidth: 250
    minHeight: 200

`export default MatdashEnvironmentService`
