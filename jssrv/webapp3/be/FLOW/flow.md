```
┌──────────────┐      ┌───────────┐ 	 ┌──────────────┐ 	   ┌──────────┐ 
│   CREATE     +--1->-+ AGREEMENT +--2->-+ AGREEMENT    +--3->-+ AGREEMENT│
│NEW AGEEMENT  │      │INITIALIZED│   	 │DRAFT APPROVED│      │GENERATED │  	
└────+──────+──┘      └+───────+──┘      └──────────────┘      └────+─────┘ 
	   |			|								 |       |														  | 
┌────+───┐┌─+───────┐┌───────+──┐┌───+──────┐   
│generate││loggen.pl││mickiewicz││ stub.py  │ 
│  LISP  │|  PERL   ||   LISP   ||  python  |  
└────────┘└─────────┘└──────────┘└──────────┘  
			    |
          output.log
```
