import logging

global low_mem
low_mem = [0 for _ in range(80)]
global hi_mem
hi_mem = [0 for _ in range(80)]


def poke(mem_bank, argument1, argument2, mainFrame, infoFrame):
    logging.info(f"POKE %s, %s", argument1, argument2)
    mem_bank[argument1] = argument2

    
def print_memory(mem_bank, frame):
    break_item = 17
    line1 = []
    line2 = []
    verse = 0
   
    for i in range(0, len(mem_bank)):
        line1.append(f"{mem_bank[i]:>3}|")
        line2.append("----")
        if i % break_item == 0 and i != 0:
            frame.add_text_xy(0, verse, "".join(line1))
            
            logging.info(f"<{i}> " + "".join(line1))
            
            frame.add_text_xy(0, verse +1, "".join(line2))
            line1 = []
            line2 = []
            verse += 2
            frame.newline()
    frame.add_text_xy(0, verse, "".join(line1))
    logging.info("<  >" + "".join(line1))
    frame.add_text_xy(0, verse +1, "".join(line2))            
