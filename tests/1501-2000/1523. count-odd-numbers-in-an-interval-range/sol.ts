function countOdds(low: number, high: number): number {
  return Math.floor((high + 1) / 2) - Math.floor(low / 2);
}
