# python -m unittest test.Service1Test
import unittest
from flask import Flask
import service1files.logic_log as logic


class Service1TestCase(unittest.TestCase):
    def setUp(self):
        self.app = Flask(__name__)
        self.app.config['TESTING'] = True
        self.client = self.app.test_client()

    def test_get_info(self):
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data.decode(), 'service1')

    def test_generate_entries_srv(self):
        count = 3
        response = self.client.post(f'/generate/{count}')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data.decode(), 'Done')
        # Assert any additional conditions related to generate_entries function if required

        # Cleanup the generated entries
        logic.cleanup_entries()

if __name__ == '__main__':
    unittest.main()
