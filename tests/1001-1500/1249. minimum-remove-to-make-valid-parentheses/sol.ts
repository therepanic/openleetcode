function minRemoveToMakeValid(s: string): string {
  const t: string[] = [];
  let p = 0;
  for (const c of s) {
    if (c === "(") p++;
    else if (c === ")") p--;
    if (p >= 0) {
      t.push(c);
    } else {
      p = 0;
    }
  }
  p = 0;
  const result: string[] = [];
  for (let i = t.length - 1; i >= 0; i--) {
    const c = t[i];
    if (c === "(") p++;
    else if (c === ")") p--;
    if (p <= 0) {
      result.push(c);
    } else {
      p = 0;
    }
  }
  return result.reverse().join("");
}
