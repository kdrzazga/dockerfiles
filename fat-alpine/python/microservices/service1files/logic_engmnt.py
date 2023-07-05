import logging

from tinydb import TinyDB, Query
from datetime import datetime

id = -1

def generate_entries(count):
    db = TinyDB("engmnt.json")
    for i in range(0, count):        
        db.insert({'id': _generate_id(), 'i': i, 'msg': 'MESSAGE'})
    db.close()
    return True
    

def read_all_entries():
    db = TinyDB("engmnt.json")
    raise Exception("not implemented yet")
    db.close()


def _generate_id():
    global id
    
    if id > 0:
        id += 1
        
    else:
        id_str = datetime.now().strftime("%Y%m%d%H%M%S%f")[3:-3]
        id = int(id_str)
    
    logging.info("Generated ENGMNT id=" + str(id))
    return id
