function longestCommonSubpath(n: number, paths: number[][]): number {
  const combined: number[] = [];
  const pathOrigin: number[] = [];
  for (let i = 0; i < paths.length; i++) {
    for (const v of paths[i]) {
      combined.push(v);
      pathOrigin.push(i);
    }
    combined.push(-(i + 1));
    pathOrigin.push(i);
  }
  const N = combined.length;
  const M = paths.length;
  const S = combined;
  const P = pathOrigin;

  // rank compression
  const rank: number[] = new Array(N);
  {
    const temp = [...S].sort((a, b) => a - b);
    for (let i = 0; i < N; i++) {
      rank[i] = temp.indexOf(S[i]);
    }
  }

  let k = 1;
  while (k < N) {
    const keys: number[] = new Array(N);
    for (let i = 0; i < N; i++) {
      const first = rank[i];
      const second = i + k < N ? rank[i + k] + 1 : 0;
      // JS number is 64-bit double, but bitwise ops use 32-bit. Use BigInt?
      // Instead use string key or combine as tuple. We'll use tuple of two numbers.
      keys[i] = first * 1000000 + second; // approximate unique key
    }
    const sortedKeys = [...keys].sort((a, b) => a - b);
    for (let i = 0; i < N; i++) {
      rank[i] = sortedKeys.indexOf(keys[i]);
    }
    if (k >= N) break;
    k *= 2;
  }

  const sa: number[] = new Array(N);
  for (let i = 0; i < N; i++) {
    sa[rank[i]] = i;
  }

  const lcp: number[] = new Array(N).fill(0);
  const inv = rank;
  let h = 0;
  for (let i = 0; i < N; i++) {
    if (inv[i] > 0) {
      const j = sa[inv[i] - 1];
      while (i + h < N && j + h < N && S[i + h] === S[j + h]) {
        h++;
      }
      lcp[inv[i]] = h;
      if (h > 0) h--;
    }
  }

  let ans = 0;
  let left = 0;
  const count: number[] = new Array(M).fill(0);
  let distinct = 0;
  const minQ: number[] = [];
  for (let right = 0; right < N; right++) {
    const p = P[sa[right]];
    if (p >= 0) {
      if (count[p] === 0) distinct++;
      count[p]++;
    }
    while (minQ.length > 0 && lcp[minQ[minQ.length - 1]] >= lcp[right]) {
      minQ.pop();
    }
    minQ.push(right);

    while (distinct === M) {
      while (minQ.length > 0 && minQ[0] <= left) {
        minQ.shift();
      }
      if (minQ.length > 0) {
        ans = Math.max(ans, lcp[minQ[0]]);
      }
      const out = P[sa[left]];
      if (out >= 0) {
        count[out]--;
        if (count[out] === 0) distinct--;
      }
      left++;
    }
  }
  return ans;
}
