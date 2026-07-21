function buildArray(target: number[], n: number): string[] {
  const s: number[] = [];
  const res: string[] = [];
  let a = 0;
  for (let i = 1; i <= n; i++) {
    if (s.length === target.length && s.every((v, idx) => v === target[idx])) {
      return res;
    }
    s.push(i);
    res.push("Push");
    if (s[a] !== target[a]) {
      s.pop();
      res.push("Pop");
    } else {
      a++;
    }
  }
  return res;
}
