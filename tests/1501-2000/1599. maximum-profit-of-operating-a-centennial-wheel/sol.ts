function minOperationsMaxProfit(
  customers: number[],
  boardingCost: number,
  runningCost: number,
): number {
  let wait = 0;
  let profit = 0;
  let maxProfit = 0;
  let ans = -1;
  let i = 0;
  let rotation = 0;

  while (i < customers.length || wait > 0) {
    if (i < customers.length) {
      wait += customers[i];
    }
    let boarded = Math.min(4, wait);
    wait -= boarded;

    rotation += 1;
    profit += boarded * boardingCost - runningCost;

    if (profit > maxProfit) {
      maxProfit = profit;
      ans = rotation;
    }

    i += 1;
  }

  return ans;
}
