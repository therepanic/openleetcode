function maxScoreWords(
  words: string[],
  letters: string[],
  score: number[],
): number {
  const freq: number[] = new Array(26).fill(0);
  for (const c of letters) {
    freq[c.charCodeAt(0) - "a".charCodeAt(0)]++;
  }

  let ans = 0;

  function comb(i: number, freq: number[], total: number): void {
    if (i === words.length) {
      ans = Math.max(ans, total);
      return;
    }

    const same = [...freq];
    const rem = total;
    const tempFreq = [...freq];
    let full = true;
    let newTotal = total;

    for (const ch of words[i]) {
      const idx = ch.charCodeAt(0) - "a".charCodeAt(0);
      if (tempFreq[idx] === 0) {
        full = false;
        break;
      }
      tempFreq[idx]--;
      newTotal += score[idx];
    }

    if (full) {
      comb(i + 1, tempFreq, newTotal);
      comb(i + 1, same, rem);
    } else {
      comb(i + 1, same, rem);
    }
  }

  comb(0, freq, 0);
  return ans;
}
