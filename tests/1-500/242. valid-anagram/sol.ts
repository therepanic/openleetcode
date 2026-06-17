function isAnagram(s: string, t: string): boolean {
  if (s.length !== t.length) {
    return false;
  }

  const arr: number[] = new Array(26).fill(0);

  for (let i = 0; i < s.length; i++) {
    arr[s.charCodeAt(i) - "a".charCodeAt(0)]++;
    arr[t.charCodeAt(i) - "a".charCodeAt(0)]--;
  }

  for (const check of arr) {
    if (check !== 0) {
      return false;
    }
  }

  return true;
}
