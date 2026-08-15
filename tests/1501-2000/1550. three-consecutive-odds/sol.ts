function threeConsecutiveOdds(arr: number[]): boolean {
  return arr
    .map((x) => (x & 1).toString())
    .join("")
    .includes("111");
}
