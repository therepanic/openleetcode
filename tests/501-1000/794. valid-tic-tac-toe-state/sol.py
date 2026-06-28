from typing import List


class Solution:
    def validTicTacToe(self, board: List[str]) -> bool:
        count_x = sum(row.count("X") for row in board)
        count_o = sum(row.count("O") for row in board)

        if count_o > count_x or count_x > count_o + 1:
            return False

        def is_winner(player: str) -> bool:
            rows = any(all(board[r][c] == player for c in range(3)) for r in range(3))
            cols = any(all(board[r][c] == player for r in range(3)) for c in range(3))
            return (
                rows
                or cols
                or (
                    board[0][0] == board[1][1] == board[2][2] == player
                    or board[0][2] == board[1][1] == board[2][0] == player
                )
            )

        x_wins, o_wins = is_winner("X"), is_winner("O")

        if x_wins and o_wins:
            return False
        if x_wins and count_x != count_o + 1:
            return False
        if o_wins and count_x != count_o:
            return False

        return True
