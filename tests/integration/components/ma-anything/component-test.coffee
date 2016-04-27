`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'ma-anything', 'Integration | Component | ma anything', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{ma-anything}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#ma-anything}}
      template block text
    {{/ma-anything}}
  """

  assert.equal @$().text().trim(), 'template block text'
