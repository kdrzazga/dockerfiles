package commission

import (
	"github.com/emrahkurman/commissionservice/mongo"
	"github.com/globalsign/mgo/bson"
)

type Repository struct {
	mongoClient *mongo.Client
}

func NewRepository(mongoClient *mongo.Client) *Repository {
	repo := Repository{mongoClient}
	return &repo
}

const (
	databaseName   = "commissions"
	collectionName = "commissions"
)

func (r *Repository) GetByMerchantId(merchantId string) (*Commission, error) {
	var session = r.mongoClient.NewSession()
	defer session.Close()

	query := bson.M{"MerchantId": merchantId}

	var com *Commission
	err := session.
		DB(databaseName).
		C(collectionName).
		Find(query).
		One(&com)

	if err != nil {
		return nil, err
	}

	return com, nil
}
func (r *Repository) Insert(com *Commission) error {
	var session = r.mongoClient.NewSession()
	defer session.Close()

	err := session.
		DB(databaseName).
		C(collectionName).
		Insert(com)

	if err != nil {
		return err
	}
	return nil
}

func (r *Repository) Delete(merchantId string) error {
	var session = r.mongoClient.NewSession()
	defer session.Close()

	query := bson.M{"MerchantId": merchantId}

	err := session.
		DB(databaseName).
		C(collectionName).
		Remove(query)

	if err != nil  {
		return err
	}
	return nil
}


