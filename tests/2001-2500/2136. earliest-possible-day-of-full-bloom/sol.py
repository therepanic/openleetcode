class Solution:
    def earliestFullBloom(self, plantTime: List[int], growTime: List[int]) -> int:
        return reduce(
            lambda res, gp: max(res, gp[0]) + gp[1], 
            sorted(zip(growTime, plantTime)), 
        0)