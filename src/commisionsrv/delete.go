package commission_handlers

import (
	"github.com/emrahkurman/commissionservice/domain/commission"
	"github.com/gin-gonic/gin"
	"net/http"
)

var DeleteCommissionHandler = func(r *commission.Repository) func(c *gin.Context) {
	return func(c *gin.Context) {
		id := c.Param("merchantId")
		if len(id) == 0 {
			c.JSON(http.StatusBadRequest, gin.H{"error": "Id can not be empty!"})
			return
		}

		err := r.Delete(id)

		if err != nil {
			panic(err)
		}

		c.JSON(http.StatusOK, "Deleted")
	}
}

