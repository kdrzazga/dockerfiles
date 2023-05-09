package main

import (
	"fmt"
	"time"
)

func main() {
	for i := 1; i <= 9; i++ {
		fmt.Println(getNumberName(i))
		time.Sleep(1 * time.Second)
	}
}

func getNumberName(num int) string {
	switch num {
	case 1: return `
  _____     
 / __  \    
|\/_|\  \   
\|/ \ \  \  
     \ \  \ 
      \ \__\
       \|__|
              
`
		
	case 2: return `
       :::::::: 
     :+:    :+: 
          +:+   
       +#+      
    +#+         
  #+#           
##########      
`
		
	case 3: return "3"
		
	case 4: return `       
  //___/ /  
 /____  /   
     / /    
    / /        
`
		
	case 5: return `
 ________      
|\   ____\     
\ \  \___|_    
 \ \_____  \   
  \|____|\  \  
    ____\_\  \ 
   |\_________\
   \|_________|
                       
`
		
	case 6: return `
  dP'''   
.d8'    
8P"""Yb 
8P   8P
'YboodP     
`
		
	case 7: return `
seven 
    s
   e
  v
 e
n   
`
		
	case 8: return `
 888  
8   8 
 888  
8   8 
 888  
`
		
	case 9: return `
 ________     
|\  ___  \    
\ \____   \   
 \|____|\  \  
     __\_\  \ 
    |\_______\
    \|_______|
              
`

	default: return ""
	}
}
