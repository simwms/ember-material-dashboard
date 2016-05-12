# Takes two parameters: container and application
initialize = (app) ->
  app.inject "controller", "yieldStack", "service:yield-stack"
  app.inject "component", "yieldStack", "service:yield-stack"

YieldStackInitializer =
  name: 'yield-stack'
  initialize: initialize

`export {initialize}`
`export default YieldStackInitializer`
