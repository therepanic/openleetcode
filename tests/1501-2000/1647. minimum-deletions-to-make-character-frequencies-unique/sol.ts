function minDeletions(s: string): number {
  const count = new Array(26).fill(0);
  for (const c of s) {
    count[c.charCodeAt(0) - 97]++;
  }
  let freqs = count.filter((f) => f > 0).sort((a, b) => b - a);
  let deletes = 0;
  for (let idx = 1; idx < freqs.length; idx++) {
    if (freqs[idx] >= freqs[idx - 1]) {
      const target = Math.max(0, freqs[idx - 1] - 1);
      deletes += freqs[idx] - target;
      freqs[idx] = target;
    }
  }
  return deletes;
}
