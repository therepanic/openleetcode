function minDays(bloomDay: number[], m: number, k: number): number {
  if (m * k > bloomDay.length) return -1;

  const f = (timeLimit: number): boolean => {
    let cntr = 0;
    let bouquetCntr = 0;
    for (const day of bloomDay) {
      if (day <= timeLimit) {
        cntr++;
        if (cntr === k) {
          bouquetCntr++;
          cntr = 0;
        }
      } else {
        cntr = 0;
      }
    }
    return bouquetCntr >= m;
  };

  let s = Math.min(...bloomDay);
  let e = Math.max(...bloomDay);
  let ans = -1;

  while (s <= e) {
    const mid = s + Math.floor((e - s) / 2);
    if (f(mid)) {
      ans = mid;
      e = mid - 1;
    } else {
      s = mid + 1;
    }
  }

  return ans;
}
