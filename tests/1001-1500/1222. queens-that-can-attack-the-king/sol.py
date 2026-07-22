class Solution:
    def queensAttacktheKing(self, queens, king):
        board = [[False] * 8 for _ in range(8)]
        for r, c in queens:
            board[r][c] = True

        directions = [
            (-1, 0),
            (1, 0),
            (0, 1),
            (0, -1),
            (-1, -1),
            (-1, 1),
            (1, -1),
            (1, 1),
        ]

        ans = []
        for dr, dc in directions:
            r, c = king
            while 0 <= r < 8 and 0 <= c < 8:
                r += dr
                c += dc
                if not (0 <= r < 8 and 0 <= c < 8):
                    break
                if board[r][c]:
                    ans.append([r, c])
                    break

        return ans
