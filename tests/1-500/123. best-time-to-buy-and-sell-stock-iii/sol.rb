def max_profit(prices)
  return 0 if prices.empty?
  buy1 = -prices[0]
  sell1 = 0
  buy2 = -prices[0]
  sell2 = 0
  prices[1..].each do |price|
    buy1 = [buy1, -price].max
    sell1 = [sell1, buy1 + price].max
    buy2 = [buy2, sell1 - price].max
    sell2 = [sell2, buy2 + price].max
  end
  sell2
end
