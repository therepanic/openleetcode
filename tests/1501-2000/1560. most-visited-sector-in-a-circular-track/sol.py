class Solution:
    def mostVisited(self, n: int, rounds: list[int]) -> list[int]:
        s, e = rounds[0], rounds[-1]
        return (
            list(range(s, e + 1))
            if s <= e
            else list(range(1, e + 1)) + list(range(s, n + 1))
        )
