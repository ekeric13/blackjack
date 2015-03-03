class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  bustTemplate: _.template '
  <span> You Busted!! </span>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()

  initialize: ->
    @model.get("playerHand").on "bust", => @render(true)
    @model.get("dealerHand").on "bust", => @render(true)
    @render()

  render: (bust=false) ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.player-hand-container').prepend(@bustTemplate) if bust
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
    @$('.dealer-hand-container').prepend(@bustTemplate) if bust

