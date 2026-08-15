function isTransformable(s: string, t: string): boolean {
  if (s.split("").sort().join("") !== t.split("").sort().join("")) return false;

  const pos: number[][] = Array.from({ length: 10 }, () => []);
  for (let i = 0; i < s.length; i++) {
    pos[parseInt(s[i])].push(i);
  }

  for (const ch of t) {
    const dig = parseInt(ch);
    const i = pos[dig].shift()!;
    for (let ii = 0; ii < dig; ii++) {
      if (pos[ii].length > 0 && pos[ii][0] < i) return false;
    }
  }
  return true;
}
