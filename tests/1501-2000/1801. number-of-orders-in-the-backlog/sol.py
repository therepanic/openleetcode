class Solution:
    def getNumberOfBacklogOrders(self, orders: list[list[int]]) -> int:
        buy = []
        sell = []
        for price, amount, order_type in orders:
            if not order_type:
                while sell and sell[0][0] <= price:
                    sell_price, sell_amount = heapq.heappop(sell)
                    if amount >= sell_amount:
                        amount -= sell_amount
                    else:
                        heapq.heappush(sell, (sell_price, sell_amount - amount))
                        amount = 0
                        break
            else:
                while buy and -buy[0][0] >= price:
                    buy_price, buy_amount = heapq.heappop(buy)
                    if amount >= buy_amount:
                        amount -= buy_amount
                    else:
                        heapq.heappush(buy, (buy_price, buy_amount - amount))
                        amount = 0
                        break
            if amount > 0:
                if not order_type:
                    heapq.heappush(buy, (-price, amount))
                else:
                    heapq.heappush(sell, (price, amount))

        res = sum(x[1] for x in buy) + sum(x[1] for x in sell)
        return res % (10**9 + 7)
