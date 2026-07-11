function superpalindromesInRange(left: string, right: string): number {
  const L = BigInt(left);
  const R = BigInt(right);
  let count = 0;
  for (let i = 1; i <= 100000; i++) {
    const s = i.toString();
    const rev = s.split("").reverse().join("");
    const roots = [BigInt(s + rev.substring(1)), BigInt(s + rev)];
    for (const root of roots) {
      const sq = root * root;
      if (sq < L || sq > R) continue;
      const str = sq.toString();
      if (str === str.split("").reverse().join("")) {
        count++;
      }
    }
    if (BigInt(i) * BigInt(i) > R) break;
  }
  return count;
}
