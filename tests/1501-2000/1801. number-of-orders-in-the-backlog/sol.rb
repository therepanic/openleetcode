# @param {Integer[][]} orders
# @return {Integer}
def get_number_of_backlog_orders(orders)
    buy = []
    sell = []
    orders.each do |price, amount, order_type|
        if order_type == 0
            while !sell.empty? && sell[0][0] <= price
                sell_price, sell_amount = sell.shift
                if amount >= sell_amount
                    amount -= sell_amount
                else
                    sell.unshift([sell_price, sell_amount - amount])
                    amount = 0
                    break
                end
            end
        else
            while !buy.empty? && -buy[0][0] >= price
                buy_price, buy_amount = buy.shift
                if amount >= buy_amount
                    amount -= buy_amount
                else
                    buy.unshift([buy_price, buy_amount - amount])
                    amount = 0
                    break
                end
            end
        end
        if amount > 0
            if order_type == 0
                buy.unshift([-price, amount])
                buy.sort_by! { |x| x[0] }
            else
                sell.unshift([price, amount])
                sell.sort_by! { |x| x[0] }
            end
        end
    end
    res = buy.sum { |x| x[1] } + sell.sum { |x| x[1] }
    res % (10**9 + 7)
end
