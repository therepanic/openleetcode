function shortestCompletingWord(licensePlate: string, words: string[]): string {
  const lp: number[] = new Array(26).fill(0);
  for (const c of licensePlate.toLowerCase()) {
    if (c >= "a" && c <= "z") {
      lp[c.charCodeAt(0) - 97]++;
    }
  }
  let ans: string | null = null;
  for (const w of words) {
    const cw: number[] = new Array(26).fill(0);
    for (const c of w) {
      cw[c.charCodeAt(0) - 97]++;
    }
    let ok = true;
    for (let i = 0; i < 26; i++) {
      if (cw[i] < lp[i]) {
        ok = false;
        break;
      }
    }
    if (ok && (ans === null || w.length < ans.length)) {
      ans = w;
    }
  }
  return ans!;
}
