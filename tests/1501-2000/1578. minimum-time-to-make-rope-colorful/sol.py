class Solution(object):
    def minCost(self, colors, neededTime):
        n, sum_ = len(colors), 0
        for i in range(1, n):
            if colors[i] == colors[i - 1]:
                sum_ += min(neededTime[i], neededTime[i - 1])
                neededTime[i] = max(neededTime[i], neededTime[i - 1])
        return sum_
