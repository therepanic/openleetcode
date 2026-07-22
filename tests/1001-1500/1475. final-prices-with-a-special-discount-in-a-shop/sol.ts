function finalPrices(prices: number[]): number[] {
  const stack: number[] = [];
  for (let i = 0; i < prices.length; i++) {
    while (stack.length > 0 && prices[stack[stack.length - 1]] >= prices[i]) {
      const index = stack.pop()!;
      prices[index] -= prices[i];
    }
    stack.push(i);
  }
  return prices;
}
