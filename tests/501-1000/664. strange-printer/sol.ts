function strangePrinter(s: string): number {
  const n = s.length;
  const memo: number[][] = Array.from({ length: n }, () => Array(n).fill(-1));

  function minTurns(start: number, end: number): number {
    if (start > end) {
      return 0;
    }

    if (memo[start][end] !== -1) {
      return memo[start][end];
    }

    let res = minTurns(start, end - 1) + 1;

    for (let middle = start; middle < end; middle++) {
      if (s[middle] === s[end]) {
        res = Math.min(
          res,
          minTurns(start, middle) + minTurns(middle + 1, end - 1),
        );
      }
    }

    memo[start][end] = res;
    return res;
  }

  return minTurns(0, n - 1);
}
