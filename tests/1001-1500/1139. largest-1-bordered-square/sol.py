from itertools import accumulate, product


class Solution:
    def largest1BorderedSquare(self, g: List[List[int]]) -> int:
        f = lambda g: [[*accumulate(r, lambda q, v: v * -~q)] for r in g]
        h, v = f(g), [*zip(*f(zip(*g)))]
        return (
            max(
                (
                    size
                    for i, j in product(range(len(g)), range(len(g[0])))
                    for size in range(1, min(h[i][j], v[i][j]) + 1)
                    if h[i - size + 1][j] >= size <= v[i][j - size + 1]
                ),
                default=0,
            )
            ** 2
        )
