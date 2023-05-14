const {
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
} = require('./card');

console.log('Treasure type is: ' + TREASURE_TYPE +'\n');
console.log('Gold:\n' + JSON.stringify(gold) + '\n');
init();
drawCards(global.deck1, global.hand, 3);
console.log('Your hand:\n' + JSON.stringify(global.hand));
