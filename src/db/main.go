package main

//REQUIRED: MySql installation with parameters defined in header of file db.go (

import (
    "database/sql"
	"fmt"
	"log"	
    _ "github.com/go-sql-driver/mysql"
)

func main() {  

	fmt.Printf("Opening db manager...\n")
    db, err := sql.Open("mysql", dsn(""))
    if err != nil {
		var msg = "Error %s when opening DB\n"
        log.Printf(msg, err)
		fmt.Printf(msg)
        return
    }
	
	fmt.Printf("Connection: " + dsn("ecommerce") + "\n")	
	
	resetDb()		
    
	dbConn := connectToDb()
	createProductTable(dbConn)
	fillTableProduct(dbConn)
	readTableContent(dbConn)
	
	db.Close()
    dbConn.Close()
}
