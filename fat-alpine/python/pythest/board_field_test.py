import unittest
from board_field import BoardField

class TestBoardField(unittest.TestCase):
    def test_set_board_coords(self):
        board_field = BoardField()
        board_field.set_board_coords('a', 1)
        self.assertEqual(board_field.x, 0)
        self.assertEqual(board_field.y, 0)

        board_field.set_board_coords('h', 8)
        self.assertEqual(board_field.x, 7)
        self.assertEqual(board_field.y, 7)

        self.assertRaises(ValueError, board_field.set_board_coords, 'i', 1)
        self.assertRaises(ValueError, board_field.set_board_coords, 'a', 9)

    def test_set_table_coords(self):
        board_field = BoardField()
        board_field.set_table_coords(3, 4)
        self.assertEqual(board_field.x, 3)
        self.assertEqual(board_field.y, 4)

    def test_equals(self):
        board_field1 = BoardField(2, 3)
        board_field2 = BoardField(2, 3)
        board_field3 = BoardField(5, 5)

        self.assertTrue(board_field1.equals(board_field2))
        self.assertFalse(board_field1.equals(board_field3))

if __name__ == '__main__':
    unittest.main()
