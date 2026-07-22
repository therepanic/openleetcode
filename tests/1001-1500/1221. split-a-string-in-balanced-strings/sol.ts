function balancedStringSplit(s: string): number {
  let bal = 0;
  let count = 0;
  for (let i = 0; i < s.length; i++) {
    const c = s[i];
    if (c === "L") {
      bal++;
    } else if (c === "R") {
      bal--;
    }
    if (bal === 0) {
      count++;
    }
  }
  return count;
}
