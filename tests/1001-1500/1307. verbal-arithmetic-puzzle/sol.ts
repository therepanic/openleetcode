function isSolvable(words: string[], result: string): boolean {
  const zeroes = new Set<string>();
  let m = 0;
  for (const word of words) {
    if (word.length > 1) {
      zeroes.add(word[0]);
    }
    m = Math.max(m, word.length);
  }
  if (m > result.length) return false;

  const d = new Map<string, number>();
  for (const word of [...words, result]) {
    for (const c of word) {
      d.set(c, -1);
    }
  }
  const wordsRev = words.map((w) => w.split("").reverse().join(""));
  const resultRev = result.split("").reverse().join("");
  const R = resultRev.length;
  const N = wordsRev.length;
  const visited = new Set<number>([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);

  const rec = (wi: number, ri: number, rem: number): boolean => {
    if (ri === R) {
      return (
        rem === 0 && (result.length === 1 || d.get(resultRev[R - 1]) !== 0)
      );
    }
    if (wi === N) {
      if (d.get(resultRev[ri]) !== -1) {
        if (d.get(resultRev[ri]) !== rem % 10) return false;
        return rec(0, ri + 1, Math.floor(rem / 10));
      } else if (visited.has(rem % 10)) {
        const val = rem % 10;
        visited.delete(val);
        d.set(resultRev[ri], val);
        const ret = rec(wi, ri, rem);
        d.set(resultRev[ri], -1);
        visited.add(val);
        if (ret) return true;
      }
      return false;
    }
    if (wordsRev[wi].length <= ri) {
      return rec(wi + 1, ri, rem);
    }
    if (d.get(wordsRev[wi][ri]) !== -1) {
      return rec(wi + 1, ri, rem + d.get(wordsRev[wi][ri])!);
    }
    for (let val = 0; val < 10; val++) {
      if (visited.has(val) && (val !== 0 || !zeroes.has(wordsRev[wi][ri]))) {
        visited.delete(val);
        d.set(wordsRev[wi][ri], val);
        const ret = rec(wi + 1, ri, rem + val);
        d.set(wordsRev[wi][ri], -1);
        visited.add(val);
        if (ret) return true;
      }
    }
    return false;
  };

  return rec(0, 0, 0);
}
