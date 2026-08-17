function maximumPopulation(logs: number[][]): number {
  const l = logs.length;
  const a: number[] = [];
  let r = 0;
  let y = 0;
  for (const i of logs) {
    a.push(i[0]);
  }
  for (let j = 0; j < l; j++) {
    let c = 0;
    for (let k = 0; k < l; k++) {
      if (a[j] >= logs[k][0] && a[j] < logs[k][1] && j !== k) {
        c++;
      }
    }
    if (c > r) {
      r = c;
      y = a[j];
    }
    if (c === r && r > 0) {
      if (a[j] < y) {
        y = a[j];
      }
    }
  }
  if (y === 0) {
    return Math.min(...a);
  }
  return y;
}
