package main

//REQUIRED: MySql installation with parameters defined in header of file db.go (

import (
    _ "github.com/go-sql-driver/mysql"
)

func main() {  

    db := openDbManager()
	resetDb()		
    
	dbConn := connectToDb()
	createProductTable(dbConn)
	fillTableProduct(dbConn)
	readTableContent(dbConn)
	
	db.Close()
    dbConn.Close()
}
