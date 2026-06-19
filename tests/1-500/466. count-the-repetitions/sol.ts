function getMaxRepetitions(
  s1: string,
  n1: number,
  s2: string,
  n2: number,
): number {
  const m = s1.length;
  const n = s2.length;

  if (m * n1 < n * n2) {
    return 0;
  }

  let j = 0;
  let cnt = 0;
  let k = 0;

  const seen = new Map<number, [number, number]>();

  while (k < n1) {
    for (const ch of s1) {
      if (ch === s2[j]) {
        j++;
        if (j === n) {
          cnt++;
          j = 0;
        }
      }
    }

    k++;

    if (seen.has(j)) {
      const [prevCnt, prevK] = seen.get(j)!;
      const periodK = k - prevK;
      const periodCnt = cnt - prevCnt;

      if (periodCnt === 0) {
        break;
      }

      const remaining = n1 - k;
      const cycles = Math.floor(remaining / periodK);

      cnt += cycles * periodCnt;
      k += cycles * periodK;
    } else {
      seen.set(j, [cnt, k]);
    }
  }

  return Math.floor(cnt / n2);
}
