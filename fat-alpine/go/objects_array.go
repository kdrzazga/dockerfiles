package main
import "fmt"

type Obj struct{
    x float64
    name string    
}

func main() {
  a := make([]int, 5)
  a[3] = 4
  
  
  objs := make([]Obj, 3)
  
  objs[2].x = float64(2)
  
  
  fmt.Println("Try programiz.pro",a[3], objs[2].x, objs[2].name)
}
