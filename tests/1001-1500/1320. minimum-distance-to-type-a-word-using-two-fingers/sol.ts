function minimumDistance(word: string): number {
  const cal = (a: number, b: number): number => {
    return (
      Math.abs(Math.floor(a / 6) - Math.floor(b / 6)) +
      Math.abs((a % 6) - (b % 6))
    );
  };

  const n = word.length;
  let dp: number[] = new Array(26).fill(0);
  let ndp: number[] = new Array(26).fill(0);

  for (let i = 1; i < n; i++) {
    const p = word.charCodeAt(i - 1) - 65;
    const t = word.charCodeAt(i) - 65;

    for (let j = 0; j < 26; j++) {
      ndp[j] = dp[j] + cal(p, t);
    }

    for (let j = 0; j < 26; j++) {
      ndp[p] = Math.min(ndp[p], dp[j] + cal(j, t));
    }

    [dp, ndp] = [ndp, dp];
  }

  return Math.min(...dp);
}
