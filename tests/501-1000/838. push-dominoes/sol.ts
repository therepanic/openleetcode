function pushDominoes(dominoes: string): string {
  const s = "L" + dominoes + "R";
  let res = "";
  let prev = 0;
  for (let curr = 1; curr < s.length; curr++) {
    if (s[curr] === ".") continue;
    const span = curr - prev - 1;
    if (prev > 0) res += s[prev];
    if (s[prev] === s[curr]) {
      res += s[prev].repeat(span);
    } else if (s[prev] === "L" && s[curr] === "R") {
      res += ".".repeat(span);
    } else {
      res += "R".repeat(Math.floor(span / 2));
      if (span % 2 === 1) res += ".";
      res += "L".repeat(Math.floor(span / 2));
    }
    prev = curr;
  }
  return res;
}
