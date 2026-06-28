function numMatchingSubseq(s: string, words: string[]): number {
  const n = s.length;
  const mp: Map<string, number[]> = new Map();
  for (let i = 0; i < n; i++) {
    const c = s[i];
    if (!mp.has(c)) mp.set(c, []);
    mp.get(c)!.push(i);
  }
  for (let i = 0; i < 26; i++) {
    const c = String.fromCharCode(97 + i);
    if (!mp.has(c)) mp.set(c, []);
    mp.get(c)!.push(n);
    mp.get(c)!.sort((a, b) => a - b);
  }

  function lowerBound(arr: number[], target: number): number {
    let left = 0,
      right = arr.length;
    while (left < right) {
      const mid = left + ((right - left) >> 1);
      if (arr[mid] < target) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }
    return left;
  }

  function found(word: string): boolean {
    let curr = -1;
    for (const c of word) {
      if (curr >= n) return false;
      const arr = mp.get(c)!;
      const idx = lowerBound(arr, curr + 1);
      curr = arr[idx];
    }
    return curr < n;
  }

  let cnt = 0;
  for (const word of words) {
    if (found(word)) cnt++;
  }
  return cnt;
}
