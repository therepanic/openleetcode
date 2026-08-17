class Solution(object):
    def minOperationsMaxProfit(self, customers, boardingCost, runningCost):
        """
        :type customers: List[int]
        :type boardingCost: int
        :type runningCost: int
        :rtype: int
        """
        wait = 0
        profit = 0
        max_profit = 0
        ans = -1
        i = 0
        rotation = 0

        while i < len(customers) or wait > 0:
            if i < len(customers):
                wait += customers[i]
            boarded = min(4, wait)
            wait -= boarded

            rotation += 1
            profit += boarded * boardingCost - runningCost

            if profit > max_profit:
                max_profit = profit
                ans = rotation

            i += 1

        return ans
