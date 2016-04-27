`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'matdash-minicard', 'Integration | Component | matdash minicard', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{matdash-minicard}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#matdash-minicard}}
      template block text
    {{/matdash-minicard}}
  """

  assert.equal @$().text().trim(), 'template block text'
