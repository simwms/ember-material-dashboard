`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'matdash-windows-icon', 'Integration | Component | matdash windows icon', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{matdash-windows-icon}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#matdash-windows-icon}}
      template block text
    {{/matdash-windows-icon}}
  """

  assert.equal @$().text().trim(), 'template block text'
