const clearScreen = require('clear-screen');

function animateDragon() {
  let frame = 0;
  const shift = '                              ';
  const back = '888888888^--^--^--8888888888888';
  const bottom = '_____ __________________________';
  
  const frames = [
    `
${shift}E(  ')
${shift}     ( ) 
${shift}          ( )
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
${shift}        ( )
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
${shift}        ( )
${shift}          ( )
${shift}             (${back})
${shift}            (                                  )
${shift}            (                                  )
${shift}             (${bottom})
${shift}                //    //         //         //
${shift}                \\\\    ||         \\\\          \\\\
${shift}                ===   ==        ===        ===
${shift}    `,
`
${shift}       E(   ')
${shift}          ( ) 
${shift}            ( )
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
${shift}      ( ) 
${shift}        ( )
${shift}          ( )
${shift}             (${back})
${shift}            (                                  )
${shift}            (                                  )
${shift}             (${bottom})
${shift}                //    //         //         //
${shift}                \\\\   ||         ||         \\\\
${shift}                ===   ==        ===        ===
${shift}    `,
   `
${shift}E(   ')
${shift}     ( ) 
${shift}        ( )
${shift}          ( )
${shift}             (${back})
${shift}            (                                  )
${shift}            (                                  )
${shift}             (${bottom})
${shift}                //    //         //         //
${shift}                \\\\    ||         ||         ||
${shift}                ===   ==        ===        ===
${shift}`,
    `
${shift}E(  ')
${shift}     ( ) 
${shift}        ( )
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
    console.log(frames[frame]);

    frame++;
    if (frame === frames.length) {
      frame = 0;
    }
  }, 200);
}

animateDragon();
