`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'ma-icon', 'Integration | Component | ma icon', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{ma-icon}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#ma-icon}}
      template block text
    {{/ma-icon}}
  """

  assert.equal @$().text().trim(), 'template block text'
