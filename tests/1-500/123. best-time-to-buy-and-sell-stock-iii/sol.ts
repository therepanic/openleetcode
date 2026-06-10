function maxProfit(prices: number[]): number {
  if (prices.length === 0) {
    return 0;
  }
  let buy1 = -prices[0];
  let sell1 = 0;
  let buy2 = -prices[0];
  let sell2 = 0;
  for (let i = 1; i < prices.length; i++) {
    const price = prices[i];
    buy1 = Math.max(buy1, -price);
    sell1 = Math.max(sell1, buy1 + price);
    buy2 = Math.max(buy2, sell1 - price);
    sell2 = Math.max(sell2, buy2 + price);
  }
  return sell2;
}
