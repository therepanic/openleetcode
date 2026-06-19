function findAnagrams(s: string, p: string): number[] {
  const n1 = s.length,
    n2 = p.length;
  const res: number[] = [];
  if (n1 < n2) return res;

  const a: number[] = new Array(26).fill(0);
  const b: number[] = new Array(26).fill(0);

  for (let i = 0; i < n2; i++) {
    a[p.charCodeAt(i) - 97]++;
    b[s.charCodeAt(i) - 97]++;
  }

  if (a.every((val, idx) => val === b[idx])) res.push(0);

  for (let i = n2; i < n1; i++) {
    b[s.charCodeAt(i) - 97]++;
    b[s.charCodeAt(i - n2) - 97]--;
    if (a.every((val, idx) => val === b[idx])) res.push(i - n2 + 1);
  }

  return res;
}
