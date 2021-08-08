package main

import (
    "os"

	"github.com/emrahkurman/commissionservice/domain/commission"
	"github.com/emrahkurman/commissionservice/handlers/commission_handlers"
	"github.com/emrahkurman/commissionservice/mongo"

	"github.com/gin-gonic/gin"
)

func main()  {
	conn := os.Getenv("MONGO_ADDRESS")
	
	mongoClient, err:= mongo.NewClient(conn)
	if err!=nil{
		panic("Connection could not be established")
	}
	repo:= commission.NewRepository(mongoClient)

	 engine := gin.New()
	 engine.Use(gin.Recovery())

	 commission_handlers.InitializeRoutes(engine,repo)

	 engine.Run(":30")
}
