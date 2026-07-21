class Solution:
    def tictactoe(self, moves: List[List[int]]) -> str:
        board = [[""] * 3 for _ in range(3)]

        # Fill board
        is_A = True
        for r, c in moves:
            board[r][c] = "X" if is_A else "O"
            is_A = not is_A

        # Check rows and columns
        for i in range(3):
            if board[i][0] and board[i][0] == board[i][1] == board[i][2]:
                return "A" if board[i][0] == "X" else "B"
            if board[0][i] and board[0][i] == board[1][i] == board[2][i]:
                return "A" if board[0][i] == "X" else "B"

        # Check diagonals
        if board[1][1] and (
            (board[0][0] == board[1][1] == board[2][2])
            or (board[0][2] == board[1][1] == board[2][0])
        ):
            return "A" if board[1][1] == "X" else "B"

        return "Draw" if len(moves) == 9 else "Pending"
