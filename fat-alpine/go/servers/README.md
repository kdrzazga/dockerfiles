# 3 servers

Written in GO language
ADDRESS BOOK contains IP:port of all services. MSG SERVER reads random lines from scrip.txt and serves them to PROC SERVER 1.

```
┌──────────────┐      ┌──────────────┐  
│ PROC SERVER 1│<-----+ ADDRESS BOOK │  
│     8082     │      │     8080     │ 
└──────────────┘      └──────+───────┘ 
       ^                     |
       |                     |
 ┌─────+───────┐             | 
 │  MSG SERVER │ <-----------+
 │    8083     │
 └─────+───────┘                                                    
       |
   script.txt
```

Usage:
go run address_book.go
