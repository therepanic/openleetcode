function canBeTypedWords(text: string, brokenLetters: string): number {
  const b: boolean[] = new Array(26).fill(false);
  let res = 0;

  for (const c of brokenLetters) {
    b[c.charCodeAt(0) - 97] = true;
  }

  const words = text.split(" ");
  for (const w of words) {
    let ok = true;
    for (const c of w) {
      if (b[c.charCodeAt(0) - 97]) {
        ok = false;
        break;
      }
    }
    if (ok) {
      res++;
    }
  }

  return res;
}
