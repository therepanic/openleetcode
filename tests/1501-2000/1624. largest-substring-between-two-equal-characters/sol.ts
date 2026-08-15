function maxLengthBetweenEqualCharacters(s: string): number {
  const firstPos: number[] = new Array(26).fill(-1);
  const lastPos: number[] = new Array(26).fill(-1);
  const n = s.length;
  const base = "a".charCodeAt(0);
  for (let i = 0; i < n; i++) {
    const idx = s.charCodeAt(i) - base;
    if (firstPos[idx] === -1) firstPos[idx] = i;
  }
  for (let i = n - 1; i >= 0; i--) {
    const idx = s.charCodeAt(i) - base;
    if (lastPos[idx] === -1) lastPos[idx] = i;
  }
  let maxLen = -1;
  for (let i = 0; i < 26; i++) {
    if (firstPos[i] !== -1 && lastPos[i] !== -1) {
      maxLen = Math.max(maxLen, lastPos[i] - firstPos[i] - 1);
    }
  }
  return maxLen;
}
