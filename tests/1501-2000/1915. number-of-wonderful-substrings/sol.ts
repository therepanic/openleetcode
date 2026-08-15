function wonderfulSubstrings(word: string): number {
  const count: number[] = new Array(1024).fill(0);

  count[0] = 1;

  let mask = 0;

  let res = 0;

  for (const ch of word) {
    const bit = ch.charCodeAt(0) - "a".charCodeAt(0);

    mask ^= 1 << bit;

    res += count[mask];

    for (let i = 0; i < 10; i++) {
      res += count[mask ^ (1 << i)];
    }

    count[mask]++;
  }

  return res;
}
