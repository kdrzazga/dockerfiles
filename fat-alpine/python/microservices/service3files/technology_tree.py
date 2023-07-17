import logging
import yaml

def load_technology_tree(file_path):
    with open(file_path, 'r') as file:
        technology_tree = yaml.safe_load(file)
    return technology_tree

class TechnologyTree:

    def __init__(self, file_path):
        self.technology_tree = load_technology_tree(file_path)
        self.current_tech = None
        self.progress_path = []
        self.progress = 0
        self.done = False

    def start_tech_develop(self, technology_name):
        self.progress_path = [technology_name]
        self.progress = 0
        
        current_node = self.technology_tree[technology_name]
        while current_node != 'start':
            for tech_name, tech_data in self.technology_tree.items():
                if 'next-tech' in tech_data and technology_name in tech_data['next-tech'].split(', '):
                    current_node = tech_data
                    technology_name = tech_name
                    self.progress_path.append(tech_name)
                    
                    if tech_name == 'start':
                        self.progress_path.reverse()
                        return
                    
                    break

    def proceed_tech_develop(self):
        if self.done == True:
            logging.warning("Goal already achieved")
            return False
        
        flatten_path = get_flatten_progress_path()
        self.progress += 1
        if self.progress >= len(flatten_path):
            self.done = True
            return True
        else:
            print("Currently working on " + flatten_path[self.progress])
            return True
        
    def get_flatten_progress_path(self):
        flat_progress_path = []
        for path in self.progress_path:
            count = int(self.technology_tree[path]['time'])
            for i in range(count):
                flat_progress_path.append(path)
                
        return flat_progress_path        
    
    def get_current_tech(self):
        if self.current_tech is not None:
            return self.current_tech
        else:
            return None
    
    def print_progress_path(self):
        for i, tech in enumerate(self.progress_path):
            print(str(i) + ': ' + tech)


#file_path = 'tech-tree.yml'
#tech_tree = TechnologyTree(file_path)

#tech_tree.start_tech_develop('republic')
#tech_tree.print_progress_path()
#tech_tree.get_flatten_progress_path()
