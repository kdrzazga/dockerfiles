import unittest

from pysweeper.model.board import Board


class BoardTest(unittest.TestCase):

    def setUp(self) -> None:
        self._small_board = Board(3, 2, 1)
        self._extreme_board = Board(7, 5, 35)
        self._empty_board = Board(7, 5, 0)
        self._big_board = Board(10, 11, 15)

    def test_board_setup(self):
        self.assertEquals(len(self._small_board.mines), 1)
        self.assertEquals(len(self._extreme_board.mines), 35)
        self.assertEquals(len(self._empty_board.mines), 0)
        self.assertEquals(len(self._big_board.mines), 15)


if __name__ == '__main__':
    unittest.main()
