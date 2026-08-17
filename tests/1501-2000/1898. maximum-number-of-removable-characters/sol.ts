function maximumRemovals(s: string, p: string, removable: number[]): number {
  let left = 0,
    right = removable.length;
  let maxK = 0;
  while (left <= right) {
    const mid = Math.floor((left + right) / 2);
    const removed = new Array(s.length).fill(false);
    for (let i = 0; i < mid; i++) {
      removed[removable[i]] = true;
    }
    let j = 0;
    for (let i = 0; i < s.length && j < p.length; i++) {
      if (!removed[i] && s[i] === p[j]) {
        j++;
      }
    }
    if (j === p.length) {
      maxK = mid;
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return maxK;
}
