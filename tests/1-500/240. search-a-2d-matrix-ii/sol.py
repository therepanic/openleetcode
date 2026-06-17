class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        v=False
        for i in matrix:
            for j in range(len(i)):
                if i[j]==target:
                    v=True
        return v