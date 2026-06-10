function canCompleteCircuit(gas: number[], cost: number[]): number {
  let total = 0,
    tank = 0,
    start = 0;
  for (let i = 0; i < gas.length; i++) {
    const diff = gas[i] - cost[i];
    total += diff;
    tank += diff;
    if (tank < 0) {
      tank = 0;
      start = i + 1;
    }
  }
  return total < 0 ? -1 : start;
}
