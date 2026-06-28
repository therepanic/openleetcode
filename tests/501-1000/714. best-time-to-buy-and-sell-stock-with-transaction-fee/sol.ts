function maxProfit(prices: number[], fee: number): number {
  let hold = -prices[0];
  let cash = 0;

  for (let i = 1; i < prices.length; i++) {
    cash = Math.max(cash, hold + prices[i] - fee);
    hold = Math.max(hold, cash - prices[i]);
  }

  return cash;
}
