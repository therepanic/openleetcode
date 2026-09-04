class Solution:
    def getDescentPeriods(self, prices: List[int]) -> int:
        sum, des, prev=0, 0, -1
        for x in prices:
            des=(-((x+1)==prev) & des)+1
            sum+=des
            prev=x
        return sum