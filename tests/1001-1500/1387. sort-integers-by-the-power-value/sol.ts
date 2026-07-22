function getKth(lo: number, hi: number, k: number): number {
  const vc: [number, number][] = [];
  for (let i = lo; i <= hi; i++) {
    let num = i;
    let count = 0;
    while (num !== 1) {
      if (num % 2 === 0) {
        num = Math.floor(num / 2);
      } else {
        num = 3 * num + 1;
      }
      count++;
    }
    vc.push([i, count]);
  }
  vc.sort((a, b) => {
    if (a[1] !== b[1]) return a[1] - b[1];
    return a[0] - b[0];
  });
  return vc[k - 1][0];
}
