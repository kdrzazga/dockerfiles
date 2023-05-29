import random


class Point:

    def __init__(self, x: int, y: int):
        self._x = x
        self._y = y

    def get_x(self) -> int:
        return self._x

    def get_y(self) -> int:
        return self._y


class Board:

    def __init__(self, size_x: int, size_y: int, bomb_count: int):
        self.width = size_x
        self.height = size_y
        _all_cells = []
        _mines = []

        for x in range(size_x - 1):
            for y in range(size_y - 1):
                _all_cells.append(Point(x, y))

        while bomb_count > 0:
            bomb_place = _all_cells.pop(random.randint(0, len(_all_cells) - 1))
            _mines.append(bomb_place)
            bomb_count -= 1

        self.mines = tuple(_mines)
