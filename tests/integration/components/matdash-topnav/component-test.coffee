`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'matdash-topnav', 'Integration | Component | matdash topnav', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{matdash-topnav}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#matdash-topnav}}
      template block text
    {{/matdash-topnav}}
  """

  assert.equal @$().text().trim(), 'template block text'
