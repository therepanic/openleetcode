class Solution(object):
    def checkMove(self, board, rMove, cMove, color):
        """
        :type board: List[List[str]]
        :type rMove: int
        :type cMove: int
        :type color: str
        :rtype: bool
        """
        opposite = "W" if color == "B" else "B"
        directions = [
            (-1, -1),
            (-1, 0),
            (-1, 1),
            (0, -1),
            (0, 1),
            (1, -1),
            (1, 0),
            (1, 1),
        ]

        for dr, dc in directions:
            r, c = rMove + dr, cMove + dc
            count = 0

            while 0 <= r < 8 and 0 <= c < 8 and board[r][c] == opposite:
                r += dr
                c += dc
                count += 1

            if count >= 1 and 0 <= r < 8 and 0 <= c < 8 and board[r][c] == color:
                return True

        return False
