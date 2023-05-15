const {
	shuffle
} = require('./lib.js');

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


global.playerDeck = [];
global.hand = [];
global.discardDeck =[];
global.table = [];


function init(){
global.playerDeck = [copper, copper, copper, copper, copper, copper, copper, property, property, property];
global.hand = [];
global.discardDeck =[];
global.table = [];	
global.boardDeck = {
	copper: 50,
	militia: 10,
	moat: 10
	};
}

function drawCards(deck, hand, numCards) {
  for (let i = 0; i < numCards; i++) {
    if (deck.length === 0) {
      console.log('No more cards in the Deck. Shuffling discard and transfering to the Deck');
	  transferDiscardToplayerDeck();
    }
    const randomIndex = Math.floor(Math.random() * deck.length);
    const drawnCard = deck.splice(randomIndex, 1)[0];
    hand.push(drawnCard);
  }
}

function discardHand(){
	global.discardDeck.push(...global.hand);
	global.hand.splice(0);
}

function transferDiscardToplayerDeck(){
	global.playerDeck.push(...global.discardDeck);
	global.discardDeck.splice(0);
}

function buy(cardName) {
  if (global.boardDeck.hasOwnProperty(cardName) && global.boardDeck[cardName] > 0) {
    global.boardDeck[cardName] -= 1;
    console.log(`Bought ${cardName} card. Remaining quantity: ${boardDeck[cardName]}`);
	global.discardDeck.push(cardName);
	
  } else {
    console.log(`Cannot buy ${cardName} card. Insufficient quantity.`);
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
  playerDeck,
  hand,
  discardDeck,
  table,
  init,
  drawCards,
  discardHand,
  buy
};
