function brokenCalc(startValue: number, target: number): number {
  let ans = 0;
  while (target > startValue) {
    ans++;
    if (target % 2 === 1) {
      target += 1;
    } else {
      target = Math.floor(target / 2);
    }
  }
  return ans + startValue - target;
}
