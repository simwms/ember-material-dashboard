`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'matdash-content', 'Integration | Component | matdash content', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{matdash-content}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#matdash-content}}
      template block text
    {{/matdash-content}}
  """

  assert.equal @$().text().trim(), 'template block text'
