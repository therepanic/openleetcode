class Solution:
    def countPoints(self, rings: str) -> int:
        sets = [set() for _ in range(10)]
        for i in range(0, len(rings), 2):
            sets[int(rings[i + 1])].add(rings[i])
        return sum(len(s) == 3 for s in sets)