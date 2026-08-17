class Solution(object):
    def findRotation(self, mat, target):
        """
        :type mat: List[List[int]]
        :type target: List[List[int]]
        :rtype: bool
        """
        for _ in range(4):
            if mat == target:
                return True
            # Rotate 90 degrees clockwise
            mat = [list(row) for row in zip(*mat[::-1])]
        return False
