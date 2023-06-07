const clearScreen = require('clear-screen');

function animateDragon() {
  let frame = 0;
  const shift = '                              ';
  const fire1 = '                          **  ';
  const fire2 = '                      **      ';
  const fire3 = '                  **          ';
  const fire4 = '              **              ';
  const fire5 = '          **                  ';
  const fire6 = '      **                      ';
  const fire7 = '**                            ';
  const back = '888888888^--^--^--8888888888888';
  const bottom = '_____ __________________________';
  
  const frames = [
    `
${shift}
${shift}
${fire1}E(  ')( ) 
${shift}        ( )( )
${shift}              (${back})
${shift}             (                                  )
${shift}             (                                  )
${shift}              (${bottom})
${shift}                 //    //         //         //
${shift}                 \\\\    ||         ||         ||
${shift}                 ===   ==        ===        ===
${shift}`,
    `
${shift}E(  ')
${shift}     ( ) 
${fire2}          ( )
${shift}              ( )
${shift}                 (${back})
${shift}                (                                  )
${shift}                (                                  )
${shift}                 (${bottom})
${shift}                    //    //         //         //
${shift}                   //    //         //         //
${shift}                 ===   ===        ===        ===
${shift}    `,
    `
${shift}E(   ')
${shift}     ( ) 
${fire3}        ( )
${shift}          ( )
${shift}             (${back})
${shift}            (                                  )
${shift}            (                                  )
${shift}             (${bottom})
${shift}                //    //         //         //
${shift}                ||    ||         ||         ||
${shift}                ===   ==        ===        ===
${shift}    `,
    `
${shift}  E(    ')
${shift}       ( ) 
${fire4}        ( )
${shift}          ( )
${shift}             (${back})
${shift}            (                                  )
${shift}            (                                  )
${shift}             (${bottom})
${shift}                //    //         //         //
${shift}                \\\\    ||         \\\\          \\\\
${shift}                ===   ==        ===         ===
${shift}    `,
`
${shift}       E(   ')
${shift}          ( ) 
${fire5}            ( )
${shift}           ( )
${shift}             (${back})
${shift}            (                                  )
${shift}            (                                  )
${shift}             (${bottom})
${shift}                //    //         //         //
${shift}                \\\\    \\\\         ||          ||
${shift}                ===   ==        ===        ===
${shift}    `,
`
${shift}   
${shift}   E(    ')
${fire6}      ( ) 
${shift}        ( )
${shift}          ( )
${shift}             (${back})
${shift}            (                                  )
${shift}            (                                  )
${shift}             (${bottom})
${shift}                //    //         //         //
${shift}                \\\\   ||         ||         \\\\
${shift}                ===   ==        ===         ===
${shift}    `,
   `
${shift}E(   ')
${shift}     ( ) 
${fire7}        ( )
${shift}          ( )
${shift}             (${back})
${shift}            (                                  )
${shift}            (                                  )
${shift}             (${bottom})
${shift}                //    //         //         //
${shift}                \\\\    ||         ||         ||
${shift}                ===   ==        ===        ===
${shift}`,
  ];

  setInterval(() => {
    clearScreen();
    console.log("DRAGON ANIMATION");
    console.log(frames[frame]);
    if (frame != 5){
      console.log('');
    }
    console.log(`[${frame}]`);
    frame++;
    if (frame === frames.length) {
      frame = 0;
    }
  }, 200);
}

animateDragon();
