function minCharacters(a: string, b: string): number {
  const freqA: number[] = new Array(26).fill(0);
  const freqB: number[] = new Array(26).fill(0);

  for (const ch of a) {
    freqA[ch.charCodeAt(0) - 97]++;
  }
  for (const ch of b) {
    freqB[ch.charCodeAt(0) - 97]++;
  }

  const lenA = a.length;
  const lenB = b.length;
  let res = Number.MAX_SAFE_INTEGER;
  let sumA = 0,
    sumB = 0;

  for (let i = 0; i < 25; i++) {
    sumA += freqA[i];
    sumB += freqB[i];
    res = Math.min(res, lenA - sumA + sumB);
    res = Math.min(res, lenB - sumB + sumA);
  }

  for (let i = 0; i < 26; i++) {
    res = Math.min(res, lenA - freqA[i] + (lenB - freqB[i]));
  }

  return res;
}
