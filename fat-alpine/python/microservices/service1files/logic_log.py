from tinydb import TinyDB, Query
from datetime import datetime


def generate_entries(count):
    db = TinyDB("log.json")
    for i in range(0, count):        
        db.insert({'timestamp': datetime.now().strftime("%Y-%m-%d %H:%M:%S"), 'i': i, 'msg': 'MESSAGE'})
    db.close()
    return True
    

def read_all_entries():
    db = TinyDB("log.json")
    raise Exception("not implemented yet")
    db.close()
