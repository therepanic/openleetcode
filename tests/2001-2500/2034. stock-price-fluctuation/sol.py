class Solution:
    from sortedcontainers import SortedDict
    class StockPrice:

        def __init__(self):
            #For each price map to a list of timestamps
            #We need to map to a list because the same price can exist at different timestamps
            self.price_to_t=SortedDict()
            #For each timestamp map to a price
            self.t_to_price=SortedDict()

        def update(self, timestamp: int, price: int) -> None:
            if timestamp in self.t_to_price:
                oldprice = self.t_to_price[timestamp]
                self.price_to_t[oldprice].pop(self.price_to_t[oldprice].index(timestamp))
                if not len(self.price_to_t[oldprice]):
                    self.price_to_t.pop(oldprice)
            self.t_to_price[timestamp]=price
            if price not in self.price_to_t:
                self.price_to_t[price]=[timestamp]
            else:
                self.price_to_t[price].append(timestamp)

        def current(self) -> int:
            t,p =self.t_to_price.peekitem(-1)
            return p

        def maximum(self) -> int:
            p,t= self.price_to_t.peekitem(-1)
            return p

        def minimum(self) -> int:
            p,t= self.price_to_t.peekitem(0)
            return p


    # Your StockPrice object will be instantiated and called as such:
    # obj = StockPrice()
    # obj.update(timestamp,price)
    # param_2 = obj.current()
    # param_3 = obj.maximum()
    # param_4 = obj.minimum()
