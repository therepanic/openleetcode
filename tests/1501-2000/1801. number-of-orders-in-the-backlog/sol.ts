function getNumberOfBacklogOrders(orders: number[][]): number {
  const buy: [number, number][] = [];
  const sell: [number, number][] = [];
  for (const [price, amount0, type] of orders) {
    let amount = amount0;
    if (type === 0) {
      while (sell.length > 0 && sell[0][0] <= price) {
        const s = sell[0];
        sell.splice(0, 1);
        if (amount >= s[1]) {
          amount -= s[1];
        } else {
          sell.unshift([s[0], s[1] - amount]);
          amount = 0;
          break;
        }
      }
    } else {
      while (buy.length > 0 && -buy[0][0] >= price) {
        const b = buy[0];
        buy.splice(0, 1);
        if (amount >= b[1]) {
          amount -= b[1];
        } else {
          buy.unshift([b[0], b[1] - amount]);
          amount = 0;
          break;
        }
      }
    }
    if (amount > 0) {
      if (type === 0) {
        buy.unshift([-price, amount]);
        buy.sort((a, b) => a[0] - b[0]);
      } else {
        sell.unshift([price, amount]);
        sell.sort((a, b) => a[0] - b[0]);
      }
    }
  }
  const sum = (arr: [number, number][]) =>
    arr.reduce((acc, x) => acc + x[1], 0);
  const res = sum(buy) + sum(sell);
  return res % 1_000_000_007;
}
