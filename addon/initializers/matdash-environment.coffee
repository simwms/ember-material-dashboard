# Takes two parameters: container and application
initialize = (application) ->
  application.inject 'controller', 'matdash', 'service:matdash-environment'
  application.inject 'component', 'matdash', 'service:matdash-environment'

MatdashEnvironmentInitializer =
  name: 'matdash-environment'
  initialize: initialize

`export {initialize}`
`export default MatdashEnvironmentInitializer`
