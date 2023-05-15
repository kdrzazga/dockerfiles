const {
  //constants:
  TREASURE_TYPE,
  ACTION_TYPE,
  PROPERTY_TYPE,
  OPPONENT_DISCARD,
  MILITIA_PROTECTION,
  DRAW_2_CARDS,
  TREASURE_BONUS,
  gold,
  
  //functions:
  init,
  drawCards,
  discardHand,
  buy
} = require('./card');

function logStatus(header){
	console.log('\n');
	if (header != '')
		console.log(header);
	console.log('Your hand:\n' + JSON.stringify(global.hand));
	console.log('Deck:\n' + JSON.stringify(global.playerDeck));
	console.log('Discard Deck:\n' + JSON.stringify(global.discardDeck));
	console.log('Table:\n' + JSON.stringify(global.table));
	console.log('Board Decks:\n' + JSON.stringify(global.boardDeck));
}

console.log('Treasure type is: ' + TREASURE_TYPE +'\n');
console.log('Gold:\n' + JSON.stringify(gold) + '\n');

init();

drawCards(global.playerDeck, global.hand, 5);
logStatus('After drawing cards:');

buy(militia);
buy(moat);
buy(moat);

discardHand();
logStatus('After discarding hand:');
