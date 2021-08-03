package main

import (
    "strconv"
    "math/rand"
	"math"
)

var lastId, productIndex int

func generateProductQuery() string{		
	products := []string{"TV", "car", "laptop", "Hi Fi", "discman"}
	
	productIndex += rand.Intn(len(products))
	lastId += rand.Intn(2) + 1		
	randomPrice := 1000 + lastId + productIndex * int(300 * (math.Sin(float64(productIndex) /15) + 1))
	
	return ` VALUES(` + strconv.Itoa(lastId) + `, '` + products[productIndex % len(products)] + `' ,` + strconv.Itoa(randomPrice) + `)`
}