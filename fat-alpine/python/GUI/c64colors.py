#based on https://c64online.com/commodore-64-color-codes/

colors = {
    "black" : {
            "rgb" : "(0, 0, 0)",
            "web" : "#000000",
            "petscii": 144
        },
        
    "white" : {
            "rgb" : "(255, 255, 255)",
            "web" : "#ffffff",
            "petscii": 5
        },
        
    "red" : {
            "rgb" : "(136, 0, 0)",
            "web" : "#880000",
            "petscii": 28
        },
        
    "cyan" : {
            "rgb" : "(170, 255, 238)",
            "web" : "#AAFFEE",
            "petscii": 159
        },
        
    "purple" : {
            "rgb" : "(204, 68, 204)",
            "web" : "#CC44CC",
            "petscii": 156
        },
        
    "green" : {
            "rgb" : "(0, 204, 85)",
            "web" : "#00CC55",
            "petscii": 30
        },
        
    "blue" : {
            "rgb" : "(0, 0, 170)",
            "web" : "#0000AA",
            "petscii": 31
        },
        
    "yellow" : {
            "rgb" : "(238, 238, 119)",
            "web" : "#EEEE77",
            "petscii": 158
        },
        
    "orange" : {
            "rgb" : "(221, 136, 85)",
            "web" : "#DD8855",
            "petscii": 129
        },
        
    "brown" : {
            "rgb" : "(102, 68, 0)",
            "web" : "#664400",
            "petscii": 149
        },
        
    "light red" : {
            "rgb" : "(255, 119, 119)",
            "web" : "#FF7777",
            "petscii": 150
        },
        
    "grey1" : {
            "rgb" : "(51, 51, 51)",
            "web" : "#333333",
            "petscii": 151
        },
        
    "grey2" : {
            "rgb" : "(119, 119, 119)",
            "web" : "#777777",
            "petscii": 152
        },
        
    "light green" : {
            "rgb" : "(170, 255, 102)",
            "web" : "#AAFF66",
            "petscii": 153
        },
        
    "light blue" : {
            "rgb" : "(0, 136, 255)",
            "web" : "#0088FF",
            "petscii": 154
        },
        
    "grey3" : {
            "rgb" : "(187, 187, 187)",
            "web" : "#BBBBBB",
            "petscii": 155
        },        
    }
    
def get_color(name: str):
    return colors[name.lower()]