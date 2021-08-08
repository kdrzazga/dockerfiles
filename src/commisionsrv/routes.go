package commission_handlers

import (
	"github.com/emrahkurman/commissionservice/domain/commission"
	"github.com/gin-gonic/gin"
)

func InitializeRoutes(e *gin.Engine,r *commission.Repository) {
	e.GET("commissions/merchantId/:merchantId", GetCommissionByMerchantIdHandler(r))
	e.POST("/commissions", PostSingleCommissionHandler(r))
	e.DELETE("/commissions/merchantId/:merchantId", DeleteCommissionHandler(r))
}

