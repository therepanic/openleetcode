function checkInclusion(s1: string, s2: string): boolean {
  const n1 = s1.length,
    n2 = s2.length;
  if (n2 < n1) return false;

  const c1: number[] = new Array(26).fill(0);
  const c2: number[] = new Array(26).fill(0);
  const a = "a".charCodeAt(0);

  for (let i = 0; i < n1; i++) {
    c1[s1.charCodeAt(i) - a]++;
    c2[s2.charCodeAt(i) - a]++;
  }

  if (c1.every((v, idx) => v === c2[idx])) return true;

  for (let i = n1; i < n2; i++) {
    c2[s2.charCodeAt(i) - a]++;
    c2[s2.charCodeAt(i - n1) - a]--;

    if (c1.every((v, idx) => v === c2[idx])) return true;
  }

  return false;
}
