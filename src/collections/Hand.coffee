class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    @on('hit', @checkScore, @)

  hit: ->
    @add(@deck.pop())
    @trigger "hit", @

  checkScore: ->
    if @score() > 21
      @trigger 'bust', @

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  score: ->
    if @minScore() + 10 * @hasAce() > 21
      @minScore()
    else
      @minScore() + 10 * @hasAce()

    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.


