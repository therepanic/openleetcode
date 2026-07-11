function backspaceCompare(s: string, t: string): boolean {
  function getNextValidCharIndex(str: string, end: number): number {
    let backspaceCount = 0;
    while (end >= 0) {
      if (str[end] === "#") {
        backspaceCount++;
      } else if (backspaceCount > 0) {
        backspaceCount--;
      } else {
        break;
      }
      end--;
    }
    return end;
  }

  let ps = s.length - 1;
  let pt = t.length - 1;

  while (ps >= 0 || pt >= 0) {
    ps = getNextValidCharIndex(s, ps);
    pt = getNextValidCharIndex(t, pt);

    if (ps < 0 && pt < 0) {
      return true;
    }
    if (ps < 0 || pt < 0) {
      return false;
    } else if (s[ps] !== t[pt]) {
      return false;
    }

    ps--;
    pt--;
  }

  return true;
}
