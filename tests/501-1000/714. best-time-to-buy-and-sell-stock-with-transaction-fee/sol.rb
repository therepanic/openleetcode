# @param {Integer[]} prices
# @param {Integer} fee
# @return {Integer}
def max_profit(prices, fee)
    hold = -prices[0]
    cash = 0

    prices[1..].each do |price|
        cash = [cash, hold + price - fee].max
        hold = [hold, cash - price].max
    end

    cash
end
