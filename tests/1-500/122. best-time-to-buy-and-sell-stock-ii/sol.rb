def max_profit(prices)
  profit = 0
  (1...prices.length).each do |i|
    if prices[i] > prices[i - 1]
      profit += prices[i] - prices[i - 1]
    end
  end
  profit
end
