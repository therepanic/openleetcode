class Solution:
    def countKDifference(self, nums: List[int], k: int) -> int:
        c = Counter(nums)
        return sum(c[x] * c[x + k] for x in c)
