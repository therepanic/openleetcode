class Solution(object):
    def numOfBurgers(self, tomatoSlices, cheeseSlices):
        """
        :type tomatoSlices: int
        :type cheeseSlices: int
        :rtype: List[int]
        """
        if (tomatoSlices - 2 * cheeseSlices) % 2 != 0:
            return []

        x = (tomatoSlices - 2 * cheeseSlices) // 2
        y = cheeseSlices - x

        if x < 0 or y < 0:
            return []

        return [x, y]
