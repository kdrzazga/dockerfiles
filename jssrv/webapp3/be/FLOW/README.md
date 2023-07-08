```
┌──────────────┐      ┌───────────┐ 	 ┌──────────────┐      ┌──────────┐ 
│   CREATE     +──1─>─+ AGREEMENT +──2─>─+ AGREEMENT    +──3─>─+ AGREEMENT+──4─>─────────+
│NEW COMMITMENT│      │INITIALIZED│   	 │DRAFT APPROVED│      │GENERATED │              │  	
└──────────────┘      └───────────┘      └──────────────┘      └──────────┘              V
                                                                                         │									   
┌──────────────┐      ┌───────────┐ 	 ┌──────────────┐      ┌──────────┐       ┌──────+───────┐ 
│  COMMITMENT  │      │   OPEN    +─<─7──+     PLAN     +─<─6──+ PENDING  +──<─5──+  AGREEMENT   │
│    CLOSED    │      │COMMITMENT │   	 │ IN PROGRESS  │      │ PAYMENT  │       │SENT TO CLIENT│ 
└──────+───────┘      └────+──────┘      └──────────────┘      └──────────┘       └──────+───────┘      
       │                   │8                                                            │
       ^                   V                                                             ^
       │              ┌────+──────┐      ┌────────────────────────────────┐              │
       +────<──9──────+ COMMITMENT+─10─>─+   COMMITMENT PENDING RENEWAL   +───11─>───────+    
                      │  PENDING  │      └────────────────────────────────┘
                      │  CLOSURE  │      
                      └───────────┘                             
```

1 - USER or ADMIN initiates the agreement (POST /init-agreement)

2 - ADMIN approves the draft (POST /approve-draft)

3 - SYSTEM generates the agreement or ADMIN forces that (POST /generate-agreement)

4 - USER or ADMIN sends the agreement to the client (POST /send-agreement)

5 - SYSTEM or ADMIN confirms sending

6 - SYSTEM or ADMIN confirms payment

7 - ADMIN approves the plan (POST /approve-plan)

8 - SYSTEM reacts on agreement expiration or ADMIN forces that

9 - USER or ADMIN confirms that client DOES NOT WANT to exted the commitment

10 - USER or ADMIN confirms that client WANTS to extend the commitment 

11 - USER or ADMIN generates new agreement for the client (POST /renew)
