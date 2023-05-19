const figlet = require('figlet');

function info(){
	return [
		'Rules are simple and well-known'
	];	
	
}

function welcome(){
	
	const logo = 'Tic Tac Toe';
	
	figlet(logo, function(err, data) {
	if (err) {
		console.log('Something went wrong...');
		console.dir(err);
    return;
	}
	return data;
	});	
}

module.exports = {
	info,
	welcome	
};