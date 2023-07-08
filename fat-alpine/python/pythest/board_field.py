class BoardField:
    available_xs = "abcdefgh"
    INDEX_OOB_MSG = "Index out of bounds for "

    def __init__(self, table_x=None, table_y=None):
        self.x = None
        self.y = None

        if table_x is not None and table_y is not None:
            self.set_table_coords(table_x, table_y)

    def set_board_coords(self, x, y):
        x = x.lower()
        self.x = self.available_xs.index(x)

        if self.x == -1:
            raise ValueError(self.INDEX_OOB_MSG + "x=" + x)

        if not 0 <= y <= 7:
            raise ValueError(self.INDEX_OOB_MSG + "y=" + str(y))

        self.y = y

    def set_table_coords(self, value_x, value_y):
        self.x = value_x
        self.y = value_y

    def equals(self, board_field):
        return self.x == board_field.x and self.y == board_field.y
