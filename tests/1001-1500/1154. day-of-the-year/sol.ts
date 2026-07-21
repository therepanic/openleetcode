function dayOfYear(date: string): number {
  const val: { [key: number]: number } = {
    1: 0,
    2: 31,
    3: 59,
    4: 90,
    5: 120,
    6: 151,
    7: 181,
    8: 212,
    9: 243,
    10: 273,
    11: 304,
    12: 334,
  };
  const d = parseInt(date.substring(8));
  const m = parseInt(date.substring(5, 7));
  const y = parseInt(date.substring(0, 4));
  const isLeap = y % 400 === 0 || (y % 4 === 0 && y % 100 !== 0);
  if (isLeap) {
    for (let i = 3; i <= 12; i++) {
      val[i] += 1;
    }
  }
  return d + val[m];
}
