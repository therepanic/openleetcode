function numWaterBottles(numBottles: number, numExchange: number): number {
  return numBottles + Math.floor((numBottles - 1) / (numExchange - 1));
}
