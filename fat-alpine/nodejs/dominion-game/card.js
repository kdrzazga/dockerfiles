const TREASURE_TYPE = 'treasure';
const ACTION_TYPE = 'action';
const PROPERTY_TYPE = 'property';

const OPPONENT_DISCARD = 'opponent discards 2 cards';
const MILITIA_PROTECTION = 'protects against militia';
const DRAW_2_CARDS = 'draw 2 cards from your deck';
const TREASURE_BONUS = 'trasure bonus +2';

gold = {
	type: TREASURE_TYPE,
	name: 'gold',
	cost: 6,
	value: 3
}

silver = {
	type: TREASURE_TYPE,
	name: 'silver',
	cost: 3,
	value: 2
}

copper = {
	type: TREASURE_TYPE,
	name: 'copper',
	cost: 0,
	value: 1
}

militia = {
	type: ACTION_TYPE,
	name: 'militia',
	cost: 4,
	value: 2,
	table_action: [OPPONENT_DISCARD, TREASURE_BONUS]
	}

moat = {
	type: ACTION_TYPE,
	name: 'moat',
	cost: 2,
	value: 0,
	table_action: [DRAW_2_CARDS],
	hand_action: [MILITIA_PROTECTION]
}

property = {
	type: PROPERTY_TYPE,
	cost: 2,
	value: 0	
}


global.deck1 = [];
global.hand = [];
global.discard_deck =[];
global.table = [];


function init(){
global.deck1 = [copper, copper, copper, copper, copper, copper, copper, property, property, property];
global.hand = [];
global.discard_deck =[];
global.table = [];	
}

function drawCards(deck, hand, numCards) {
  for (let i = 0; i < numCards; i++) {
    if (deck.length === 0) {
      console.log('No more cards in the deck.');
      break;
    }
    const randomIndex = Math.floor(Math.random() * deck.length);
    const drawnCard = deck.splice(randomIndex, 1)[0];
    hand.push(drawnCard);
  }
}


module.exports = {
  TREASURE_TYPE,
  ACTION_TYPE,
  PROPERTY_TYPE,
  OPPONENT_DISCARD,
  MILITIA_PROTECTION,
  DRAW_2_CARDS,
  TREASURE_BONUS,
  gold,
  deck1,
  hand,
  discard_deck,
  table,
  init,
  drawCards
};
