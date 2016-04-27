`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'matdash-sidenav-link', 'Integration | Component | matdash sidenav link', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{matdash-sidenav-link}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#matdash-sidenav-link}}
      template block text
    {{/matdash-sidenav-link}}
  """

  assert.equal @$().text().trim(), 'template block text'
