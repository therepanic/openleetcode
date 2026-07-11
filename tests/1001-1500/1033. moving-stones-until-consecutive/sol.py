class Solution(object):
    def numMovesStones(self, a, b, c):
        """
        :type a: int
        :type b: int
        :type c: int
        :rtype: List[int]
        """
        x, y, z = sorted([a, b, c])
        min_move = 0 if z - x == 2 else (1 if y - x <= 2 or z - y <= 2 else 2)
        max_move = z - x - 2
        return [min_move, max_move]
