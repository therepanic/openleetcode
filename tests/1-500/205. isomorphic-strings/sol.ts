function isIsomorphic(s: string, t: string): boolean {
  const st = Array(256).fill(-1);
  const ts = Array(256).fill(-1);
  for (let i = 0; i < s.length; i++) {
    const a = s.charCodeAt(i),
      b = t.charCodeAt(i);
    if (st[a] !== ts[b]) return false;
    st[a] = i;
    ts[b] = i;
  }
  return true;
}
