from typing import List


class Solution:
    def findJudge(self, n: int, trust: List[List[int]]) -> int:
        indgree = [0] * (n + 1)
        outdgree = [0] * (n + 1)
        for i in trust:
            outdgree[i[0]] += 1
            indgree[i[1]] += 1
        for j in range(1, n + 1):
            if outdgree[j] == 0 and indgree[j] == n - 1:
                return j
        return -1
