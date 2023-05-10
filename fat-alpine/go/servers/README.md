# 3 servers

Written in GO language
Address Book contains IP:port of all services. 

```
┌──────────────┐      ┌──────────────┐  
│PROC SERVER 1 │------│ ADDRESS BOOK │  
│    8082      │      │     8080     │ 
└──────────────┘      └──────+───────┘ 
      |                      |
 ┌─────────────┐             | 
 │  MSG SERVER │ <-----------+
 │     8083    │
 └─────────────┘                                                    
       |
   script.txt
```
