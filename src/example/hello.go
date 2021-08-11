package main

import (
	"fmt"
	"math"
	"errors"
	)

func main () {
	fmt.Println("Hello Go")
	
	x:= 7
	if x>6 {
		fmt.Println("MOre > 6");
	}
	
	a := [5]int{5, 4, 3, 2, 1} //array
	fmt.Println(a)
	
	b := []int{4, 3, 2, 1}  //slice
	c := append(b, 11) // append would not work on b := [4]int{4, 3, 2, 1}
	
	fmt.Println(b)
	fmt.Println(c)
	
	
	vertices := make(map[string]int)
	
	vertices["trojkat"] = 3
	vertices["kwadrat"] = 4
	vertices["oktagon"] = 8
	
	delete(vertices, "kwadrat")
	fmt.Println(vertices)

	for i := 0; i < 5; i++ {
		fmt.Print(i, " ")
	}
	fmt.Println()
	
	arr := []string{"ala", "b", "c"}
	
	for index, value := range arr{
		fmt.Println("index:", index, "value:", value)
	}
	
	fmt.Println(sum(2, 3))
	fmt.Println(sqrt(9))
	
	jakub := person{name: "Jakub", age: 23}
	fmt.Println(jakub)
	
	fmt.Println(&x)
	
	return
	
}

func sum(x int, y int) int {
	return x + y
}

func sqrt(x float64) (float64, error){	
	if x < 0 {
		return 0, errors.New("Negative value !")
		
	}	
	return math.Sqrt(x), nil
}


type person struct {
	name string
	age int
}