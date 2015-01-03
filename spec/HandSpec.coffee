assert = chai.assert

describe "hand", ->
  deck = null
  hand = null
  aceDiamonds = null
  nineSpades = null
  fiveSpades = null

  beforeEach ->
    aceDiamonds = new Card({rank: 1, suit: 1})
    nineSpades = new Card({rank: 9, suit: 0})
    fiveSpades = new Card({rank: 5, suit: 0})
    deck = new Deck()

  describe 'score', ->
    describe 'when we have an Ace', ->
      it 'should display the correct score', ->
        hand = new Hand([aceDiamonds, nineSpades])
        assert.strictEqual hand.score(), 20


    describe "when we have don't have an Ace", ->
      it 'should display the correct score', ->



