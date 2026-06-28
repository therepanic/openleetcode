class Solution(object):
    def updateBoard(self, board, click):
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
        rows, cols = len(board), len(board[0])
        r, c = click

        if board[r][c] == "M":
            board[r][c] = "X"
            return board

        def count_mines(r, c):
            count = 0
            for dr, dc in directions:
                nr, nc = r + dr, c + dc
                if 0 <= nr < rows and 0 <= nc < cols and board[nr][nc] == "M":
                    count += 1
            return count

        def reveal(r, c):
            if not (0 <= r < rows and 0 <= c < cols) or board[r][c] != "E":
                return
            mines = count_mines(r, c)
            if mines:
                board[r][c] = str(mines)
            else:
                board[r][c] = "B"
                for dr, dc in directions:
                    reveal(r + dr, c + dc)

        reveal(r, c)
        return board
