function expressiveWords(s: string, words: string[]): number {
  const encode = (x: string): [string[], number[]] => {
    const chars: string[] = [];
    const cnts: number[] = [];
    let prev: string | null = null;
    let c = 0;
    for (const ch of x) {
      if (ch === prev) {
        c++;
      } else {
        if (prev !== null) {
          chars.push(prev);
          cnts.push(c);
        }
        prev = ch;
        c = 1;
      }
    }
    if (prev !== null) {
      chars.push(prev);
      cnts.push(c);
    }
    return [chars, cnts];
  };

  const [sChars, sCnts] = encode(s);
  let ans = 0;
  for (const w of words) {
    const [wChars, wCnts] = encode(w);
    if (sChars.join("") !== wChars.join("")) continue;
    let ok = true;
    for (let i = 0; i < sCnts.length; i++) {
      const sc = sCnts[i],
        wc = wCnts[i];
      if (sc < wc || (sc < 3 && sc !== wc)) {
        ok = false;
        break;
      }
    }
    if (ok) ans++;
  }
  return ans;
}
