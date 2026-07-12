class Solution(object):
    def numMovesStonesII(self, stones):
        """
        :type stones: List[int]
        :rtype: List[int]
        """
        stones.sort()
        n = len(stones)

        maxMoves = max(
            stones[-1] - stones[1] - (n - 2), stones[-2] - stones[0] - (n - 2)
        )

        minMoves = n
        left = 0
        for right in range(n):
            while stones[right] - stones[left] + 1 > n:
                left += 1
            current_window_size = right - left + 1
            if (
                current_window_size == n - 1
                and stones[right] - stones[left] + 1 == n - 1
            ):
                minMoves = min(minMoves, 2)
            else:
                minMoves = min(minMoves, n - current_window_size)

        return [minMoves, maxMoves]
