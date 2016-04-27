# Ember-material-dashboard

This README outlines the details of collaborating on this Ember addon.

## Installation

* `git clone` this repository
* `npm install`
* `bower install`

## Running

* `ember server`
* Visit your app at http://localhost:4200.

## Running Tests

* `npm test` (Runs `ember try:testall` to test your addon against multiple Ember versions)
* `ember test`
* `ember test --server`

## Building

* `ember build`

For more information on using ember-cli, visit [http://ember-cli.com/](http://ember-cli.com/).

## Pig Card Game
Here, I try to come up with a DSL for the card game pig (aka Chinese hearts)

game:
  players: 4
  playerState:
    points: Number
    name: xone-of "North", "South", "East", "West"
  loseWhen: a player x reaches 1000 points, x loses
  gameOverWhen: a player loses
  eachRound:
    shuffle 
    |> deal 13 cards / player 
    |> players take turns 
    |> players are out of cards 
    |> scores are tallied
  eachTurn: (previous-turn) ->
    winner-of previous-turn plays a card
    other-players play a card of same suit in clockwise-order
    points are assigned
    winner of turn is decided
