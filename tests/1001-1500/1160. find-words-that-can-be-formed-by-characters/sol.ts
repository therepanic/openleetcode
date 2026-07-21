function countCharacters(words: string[], chars: string): number {
  const ch: { [key: string]: number } = {};
  for (const c of chars) {
    ch[c] = (ch[c] || 0) + 1;
  }

  let res = 0;
  for (const word of words) {
    const copy = { ...ch };
    let good = true;
    for (const c of word) {
      if (copy[c] !== undefined && copy[c] > 0) {
        copy[c]--;
      } else {
        res -= word.length;
        good = false;
        break;
      }
    }
    res += word.length;
  }
  return res;
}
