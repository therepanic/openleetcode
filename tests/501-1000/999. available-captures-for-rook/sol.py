from typing import List


class Solution:
    def numRookCaptures(self, board: List[List[str]]) -> int:
        pwa = 0
        for i in range(8):
            for j in range(8):
                if board[i][j] == "R":
                    for k in range(i - 1, -1, -1):
                        if board[k][j] == "B":
                            break
                        elif board[k][j] == "p":
                            pwa += 1
                            break
                    for k in range(i + 1, 8):
                        if board[k][j] == "B":
                            break
                        elif board[k][j] == "p":
                            pwa += 1
                            break
                    for k in range(j + 1, 8):
                        if board[i][k] == "B":
                            break
                        elif board[i][k] == "p":
                            pwa += 1
                            break
                    for k in range(j - 1, -1, -1):
                        if board[i][k] == "B":
                            break
                        elif board[i][k] == "p":
                            pwa += 1
                            break
        return pwa
