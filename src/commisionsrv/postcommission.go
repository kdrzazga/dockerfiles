package commission_handlers

import (
	"net/http"

	"github.com/emrahkurman/commissionservice/domain/commission"
	"github.com/emrahkurman/commissionservice/handlers/request_models"

	"github.com/gin-gonic/gin"
)

var PostSingleCommissionHandler = func(r *commission.Repository) func(c *gin.Context) {
	return func(c *gin.Context) {
		var rm *request_models.CreateCommissionModel
		err:=c.ShouldBindJSON(&rm)

		if err!=nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": "Can not bind the request!"})
			return
		}

		com:= &commission.Commission{
			MerchantId:rm.MerchantId,
			Sku:rm.Sku,
			BrandId:rm.BrandId,
			Rate:rm.Rate,
		}

		 err = r.Insert(com)

		if err != nil {
			panic(err)
		}
		c.JSON(http.StatusAccepted, "Commission Created")
	}
}
