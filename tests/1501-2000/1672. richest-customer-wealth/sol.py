class Solution(object):
    def maximumWealth(self, accounts: List[List[int]]) -> int:
        rich = 0
        for i in accounts:
            rich = max(rich, sum(i))
        return rich
