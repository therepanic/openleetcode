function maximumUnits(boxTypes: number[][], truckSize: number): number {
  boxTypes.sort((a, b) => b[1] - a[1]);
  let ans = 0;
  let remaining = truckSize;
  for (const [boxes, units] of boxTypes) {
    const quantitytaken = Math.min(remaining, boxes);
    ans += units * quantitytaken;
    remaining -= quantitytaken;
    if (remaining === 0) break;
  }
  return ans;
}
