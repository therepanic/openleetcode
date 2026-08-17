function closestCost(
  baseCosts: number[],
  toppingCosts: number[],
  target: number,
): number {
  let s: number[] = [0];
  for (let i of toppingCosts) {
    let ss: number[] = [];
    for (let j of s) {
      ss.push(j, j + i, j + 2 * i);
    }
    s = ss;
  }
  s.sort((a, b) => a - b);
  let ans = 1000000000;
  let fans = 1000000000;
  const n = s.length;
  for (let i of baseCosts) {
    const j = target - i;
    let x = 0;
    let lo = 0,
      hi = n - 1;
    while (lo <= hi) {
      const mid = Math.floor((lo + hi) / 2);
      if (s[mid] < j) {
        x = mid;
        lo = mid + 1;
      } else {
        hi = mid - 1;
      }
    }
    let ans1 = Math.abs(j - s[x]);
    if (ans1 < ans) {
      ans = ans1;
      fans = s[x] + i;
    } else if (ans1 === ans) {
      fans = Math.min(fans, s[x] + i);
    }
    if (x + 1 < n) {
      x++;
      ans1 = Math.abs(j - s[x]);
      if (ans1 < ans) {
        ans = ans1;
        fans = s[x] + i;
      } else if (ans1 === ans) {
        fans = Math.min(fans, s[x] + i);
      }
    }
  }
  return fans;
}
