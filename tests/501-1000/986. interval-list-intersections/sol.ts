function intervalIntersection(
  firstList: number[][],
  secondList: number[][],
): number[][] {
  if (firstList.length === 0 || secondList.length === 0) {
    return [];
  }

  const n = firstList.length,
    m = secondList.length;
  const res: number[][] = [];
  let i = 0,
    j = 0;

  while (i < n && j < m) {
    const s1 = firstList[i][0],
      e1 = firstList[i][1];
    const s2 = secondList[j][0],
      e2 = secondList[j][1];

    if (e1 >= s2 && s1 <= e2) {
      res.push([Math.max(s1, s2), Math.min(e1, e2)]);
    }

    if (e1 > e2) {
      j++;
    } else {
      i++;
    }
  }

  return res;
}
