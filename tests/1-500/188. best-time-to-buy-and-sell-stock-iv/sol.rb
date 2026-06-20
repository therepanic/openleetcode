def max_profit(k, prices)
  n = prices.length
  return 0 if k == 0 || n < 2
  if k >= n / 2
    ans = 0
    1.upto(n - 1) { |i| ans += [0, prices[i] - prices[i - 1]].max }
    return ans
  end

  hold = Array.new(k + 1, -(1 << 60))
  free = Array.new(k + 1, 0)
  prices.each do |price|
    1.upto(k) do |t|
      hold[t] = [hold[t], free[t - 1] - price].max
      free[t] = [free[t], hold[t] + price].max
    end
  end
  free.max
end
