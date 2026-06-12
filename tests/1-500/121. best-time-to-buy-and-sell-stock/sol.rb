def max_profit(prices)
  best = 0
  min_price = Float::INFINITY
  prices.each do |price|
    min_price = [min_price, price].min
    best = [best, price - min_price].max
  end
  best
end
