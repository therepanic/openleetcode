function maxProduct(s: string): number {
  const n = s.length;
  const palinMasks: [number, number][] = [];

  for (let mask = 1; mask < 1 << n; mask++) {
    let seq = "";
    for (let i = 0; i < n; i++) {
      if ((mask >> i) & 1) {
        seq += s[i];
      }
    }
    if (seq === seq.split("").reverse().join("")) {
      let count = 0;
      for (let i = 0; i < n; i++) {
        if ((mask >> i) & 1) count++;
      }
      palinMasks.push([mask, count]);
    }
  }

  let maxProduct = 0;
  for (let i = 0; i < palinMasks.length; i++) {
    for (let j = i + 1; j < palinMasks.length; j++) {
      const [m1, l1] = palinMasks[i];
      const [m2, l2] = palinMasks[j];
      if ((m1 & m2) === 0) {
        maxProduct = Math.max(maxProduct, l1 * l2);
      }
    }
  }

  return maxProduct;
}
