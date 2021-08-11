package main

import ("fmt"
        "math")

type Circle struct {
    x float64
    y float64
    r float64
}

func (c Circle) ToString() string {
    return fmt.Sprintf("Circle: (%f, %f) radius = %f", c.x, c.y, c.r)
}

func (c *Circle) area() float64{
    return math.Pi * c.r * c.r
}

func main(){
    var c1 Circle //all fields set to 0
    fmt.Println(c1.ToString())

    c2 := new(Circle)
    fmt.Println(c2.ToString())

    c3 := Circle{10, 15.5, 4}
    fmt.Println(c3.ToString(), " area ", c3.area()) //area as a method
}