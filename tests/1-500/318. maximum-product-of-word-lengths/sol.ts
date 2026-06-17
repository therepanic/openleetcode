function maxProduct(words: string[]): number {
  const n: number = words.length;
  const bitmasks: number[] = new Array(n).fill(0);
  for (let i = 0; i < n; i++) {
    let mask: number = 0;
    for (const c of words[i]) {
      mask |= 1 << (c.charCodeAt(0) - "a".charCodeAt(0));
    }
    bitmasks[i] = mask;
  }
  let maxProd: number = 0;
  for (let i = 0; i < n; i++) {
    for (let j = i + 1; j < n; j++) {
      if ((bitmasks[i] & bitmasks[j]) === 0) {
        maxProd = Math.max(maxProd, words[i].length * words[j].length);
      }
    }
  }
  return maxProd;
}
