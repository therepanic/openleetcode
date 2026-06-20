func maxProfit(k int, prices []int) int {
	n := len(prices)
	if k == 0 || n < 2 {
		return 0
	}
	if k >= n/2 {
		ans := 0
		for i := 1; i < n; i++ {
			if prices[i] > prices[i-1] {
				ans += prices[i] - prices[i-1]
			}
		}
		return ans
	}

	hold := make([]int64, k+1)
	free := make([]int64, k+1)
	for i := range hold {
		hold[i] = -(1 << 60)
	}
	for _, price := range prices {
		p := int64(price)
		for t := 1; t <= k; t++ {
			if free[t-1]-p > hold[t] {
				hold[t] = free[t-1] - p
			}
			if hold[t]+p > free[t] {
				free[t] = hold[t] + p
			}
		}
	}
	ans := int64(0)
	for _, value := range free {
		if value > ans {
			ans = value
		}
	}
	return int(ans)
}
