class Solution:
    def findRotation(self, mat: List[List[int]], target: List[List[int]]) -> bool:
        for _ in range(4):
            if mat == target:
                return True
            # Rotate 90 degrees clockwise
            mat = [list(row) for row in zip(*mat[::-1])]
        return False
