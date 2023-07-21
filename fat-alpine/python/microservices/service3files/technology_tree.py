import logging
import yaml

def load_technology_tree(file_path):
    with open(file_path, 'r') as file:
        technology_tree = yaml.safe_load(file)
    return technology_tree

class TechnologyTree:

    def __init__(self, file_path, starting_technology):
        self.technology_tree = load_technology_tree(file_path)
        self.starting_tech = starting_technology
        self.current_tech = None
        self.progress_path = []
        self.progress = 0
        self.done = True #at the very beginning, the devloplent is not executed, it needs to be started with start_tech_develop

    def start_tech_develop(self, technology_name):
        self.progress_path = [technology_name]
        self.progress = 0
        self.done = False

        current_node = self.technology_tree[technology_name]
        while current_node != self.starting_tech:
            for tech_name, tech_data in self.technology_tree.items():
                if 'next-tech' in tech_data and technology_name in tech_data['next-tech'].split(', '):
                    current_node = tech_data
                    technology_name = tech_name
                    self.progress_path.append(tech_name)

                    if tech_name == self.starting_tech:
                        self.progress_path.reverse()
                        return

                    break

    def proceed_tech_develop(self):
        if self.done == True:
            logging.warning("Goal already achieved")
            return "done"

        flatten_path = self.get_flatten_progress_path()
        self.progress += 1
        if self.progress >= len(flatten_path):
            self.done = True
            return "done"
        else:
            print("Currently working on " + flatten_path[self.progress])
            return "".join(flatten_path[self.progress]).join(" [").join(str(self.progress)).join("]")

    def get_flatten_progress_path(self):
        flat_progress_path = []
        for path in self.progress_path:
            count = int(self.technology_tree[path]['time'])
            for i in range(count):
                flat_progress_path.append(path)
                
        return flat_progress_path

    def get_current_tech(self):
        path = self.get_flatten_progress_path()
        
        if len(path) > 0 and self.progress < len(path):
            return path[self.progress]
        else:
            return ''

    def print_progress_path(self):
        for i, tech in self.get_progress_path():
            print(str(i) + ': ' + tech)

    def get_progress_path(self):
        return enumerate(self.progress_path)


#file_path = 'tech-tree.yml'
#tech_tree = TechnologyTree(file_path)

#tech_tree.start_tech_develop('republic')
#tech_tree.print_progress_path()
#tech_tree.get_flatten_progress_path()
