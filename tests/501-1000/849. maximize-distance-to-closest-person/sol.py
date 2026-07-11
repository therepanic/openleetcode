class Solution:
    def maxDistToClosest(self, seats: List[int]) -> int:
        l = [len(y) for y in "".join([str(x) for x in seats]).split("1")]
        return max(l[0], (max(l) + 1) // 2, l[-1])
