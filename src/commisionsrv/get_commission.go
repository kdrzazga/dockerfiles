package commission_handlers

import (
	"github.com/emrahkurman/commissionservice/domain/commission"
	"github.com/emrahkurman/commissionservice/handlers/representation"
	"github.com/gin-gonic/gin"
	"net/http"
)

var GetCommissionByMerchantIdHandler = func(r *commission.Repository) func(c *gin.Context) {
	return func(c *gin.Context) {
		merchantId := c.Param("merchantId")
		if len(merchantId) == 0 {
			c.JSON(http.StatusBadRequest, gin.H{"error": "Id can not be empty!"})
			return
		}

		com, err := r.GetByMerchantId(merchantId)
		if err != nil {
			panic(err)
		}

		if com ==nil {
			c.String(http.StatusNotFound, "")
			return
		}

		representation:=representation.CommissionRepresentation{
			MerchantId:com.MerchantId,
			Sku:com.Sku,
			BrandId:com.BrandId,
			Rate:com.Rate,
		}

		c.JSON(http.StatusOK, representation)
	}
}
