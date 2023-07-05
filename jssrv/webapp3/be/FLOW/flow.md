```
┌──────────────┐      ┌───────────┐ 	 ┌──────────────┐      ┌──────────┐ 
│   CREATE     +--1->-+ AGREEMENT +--2->-+ AGREEMENT    +--3->-+ AGREEMENT+---4->-
│NEW COMMITMENT│      │INITIALIZED│   	 │DRAFT APPROVED│      │GENERATED │  	
└──────────────┘      └───────────┘      └──────────────┘      └──────────┘ 
	   														   
┌──────────────┐      ┌───────────┐ 	 ┌──────────────┐      ┌──────────┐ 
│  COMMITMENT  |      |   OPEN    +-<-7--+ 	   PLAN     +-<-6--+ PENDING  +--<-5--
│    CLOSED    │      │COMMITMENT │   	 │ IN PROGRESS  │      | PAYMENT  │ 
└──────+───────┘      └────+──────┘      └──────────────┘      └──────────┘ 


                      ┌────+──────┐      ┌──────────────┐
       +----<--9------+ COMMITMENT+-10->-+  COMMITMENT  +---------11-->-----------
                      |  PENDING  |      |    PENDING   |
                      |  CLOSURE  |      |    RENEWAL   |
                      └───────────┘      └──────────────┘                       
```
