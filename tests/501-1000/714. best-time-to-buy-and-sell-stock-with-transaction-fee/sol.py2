class Solution(object):
    def maxProfit(self, prices, fee):
        hold = -prices[0]
        cash = 0

        for price in prices[1:]:
            cash = max(cash, hold + price - fee)
            hold = max(hold, cash - price)

        return cash
