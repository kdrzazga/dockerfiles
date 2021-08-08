package main

import (
   "io/ioutil"
   "log"
   "net/http"
)

func getRequest(url string){
    resp, err := http.Get(url)
    if err != nil {
        log.Fatalln(err)
    }
     body, err := ioutil.ReadAll(resp.Body)
       if err != nil {
          log.Fatalln(err)
     }
    //Convert the body to type string
    sb := string(body)
    log.Printf(sb)

}