import csv
import os
import unittest

import pytest as pytest

from main.model.physics.main.movement import Physics
from main.utils.file_utils import find_project_root


class TestPhysicsFormulas(unittest.TestCase):
    def setUp(self):
        print("\ncurrent directory: " + os.getcwd())

        self.test_data = []
        with open(find_project_root() + '/test/data/test_data.csv') as csvfile:
            reader = csv.DictReader(csvfile)
            for row in reader:
                self.test_data.append(row)

    @pytest.mark.unit
    def test_calculate_distance(self):
        for data in self.test_data:
            x1 = float(0)
            y1 = float(0)
            x2 = float(data['x2'])
            y2 = float(data['y2'])
            expected = float(data['distance'])
            result = Physics.calculate_distance(x1, y1, x2, y2)
            self.assertAlmostEqual(expected, result, places=2)

    @pytest.mark.unit
    def test_calculate_speed(self):
        for data in self.test_data:
            acceleration = float(data['acceleration'])
            time = float(data['time'])
            expected = float(data['speed'])
            result = Physics.calculate_distance_way(acceleration, time)
            self.assertAlmostEqual(expected, result, places=2)

    @pytest.mark.unit
    def test_calculate_time(self):
        for data in self.test_data:
            distance = float(data['distance'])
            speed = float(data['speed'])
            expected = float(data['time'])
            result = Physics.calculate_time(distance, speed)
            self.assertAlmostEqual(expected, result, places=2)


if __name__ == '__main__':
    unittest.main()
