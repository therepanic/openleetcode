class Solution:
    def twoEggDrop(self, n: int) -> int:
        # With 2 eggs and moves total moves, we can cover at most (1 + moves) * (moves / 2) floors.
        # Drop egg 1 at decreasing floor gaps (moves, moves - 1, moves - 2, ...),
        # so that whenever it breaks, egg 2 has just enough moves to scan linearly below.
        def can_determine(moves: int) -> bool:
            return (1 + moves) * (moves / 2) >= n

        res = None
        l, r = 1, n
        while l <= r:
            moves = (l + r) // 2
            if can_determine(moves):
                res = moves
                r = moves - 1
            else:
                l = moves + 1
        return res
