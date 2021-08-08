package commission

type Commission struct {
	MerchantId          string    `bson:"MerchantId"`
	Sku                 string    `bson:"Sku"`
	BrandId             string    `bson:"BrandId"`
	Rate                float64   `bson:"Rate"`
}
