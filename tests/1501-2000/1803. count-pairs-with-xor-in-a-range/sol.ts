function countPairs(nums: number[], low: number, high: number): number {
  const maxVal = Math.max(...nums);
  const bits = Math.max(
    1,
    Math.max(maxVal.toString(2).length, (high + 1).toString(2).length),
  );

  function countLess(bound: number): number {
    if (bound <= 0) return 0;
    const child: number[][] = [[-1, -1]];
    const counts: number[] = [0];
    let total = 0;
    for (const value of nums) {
      let node = 0;
      for (let bit = bits - 1; bit >= 0; bit--) {
        const v = (value >> bit) & 1;
        const b = (bound >> bit) & 1;
        if (b === 1) {
          const same = child[node][v];
          if (same !== -1) total += counts[same];
          const nxt = child[node][1 - v];
          if (nxt === -1) {
            node = -1;
            break;
          }
          node = nxt;
        } else {
          const nxt = child[node][v];
          if (nxt === -1) {
            node = -1;
            break;
          }
          node = nxt;
        }
      }
      node = 0;
      for (let bit = bits - 1; bit >= 0; bit--) {
        const v = (value >> bit) & 1;
        let nxt = child[node][v];
        if (nxt === -1) {
          nxt = child.length;
          child[node][v] = nxt;
          child.push([-1, -1]);
          counts.push(0);
        }
        node = child[node][v];
        counts[node]++;
      }
    }
    return total;
  }

  return countLess(high + 1) - countLess(low);
}
