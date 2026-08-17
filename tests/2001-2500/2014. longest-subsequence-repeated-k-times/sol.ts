function longestSubsequenceRepeatedK(s: string, k: number): string {
  function isK(sub: string, t: string, k: number): boolean {
    let count = 0;
    let i = 0;
    for (const ch of t) {
      if (i < sub.length && ch === sub[i]) {
        i++;
        if (i === sub.length) {
          i = 0;
          count++;
          if (count === k) return true;
        }
      }
    }
    return false;
  }

  let res = "";
  const q: string[] = [""];
  while (q.length > 0) {
    const curr = q.shift()!;
    for (let c = 97; c <= 122; c++) {
      const nxt = curr + String.fromCharCode(c);
      if (isK(nxt, s, k)) {
        res = nxt;
        q.push(nxt);
      }
    }
  }
  return res;
}
