function isValid(code: string): boolean {
  const tagPat = /^<(\/?)([A-Z]{1,9})>$/;
  const openCdata = "<![CDATA[";
  const closeCdata = "]]>";
  const stack: string[] = [];
  let firstTagSeen = false;
  let i = 0;
  const j = code.length;

  while (i <= j) {
    const s = code.indexOf("<", i);
    if (s === -1) break;
    const e = code.indexOf(">", s + 1);
    if (e === -1) return false;

    const candidate = code.substring(s, e + 1);
    const m = candidate.match(tagPat);

    if (m) {
      const tag = m[2];

      if (m[1] === "") {
        if (!firstTagSeen && s !== 0) return false;
        stack.push(tag);
        firstTagSeen = true;
      } else {
        if (stack.length === 0 || stack[stack.length - 1] !== tag) return false;
        if (stack.length === 1 && e !== code.length - 1) return false;
        stack.pop();
      }

      i = e + 1;
    } else if (code.startsWith(openCdata, s)) {
      const k = code.indexOf(closeCdata, s + openCdata.length);
      if (k === -1) return false;
      i = k + closeCdata.length;
    } else {
      return false;
    }
  }

  return stack.length === 0 && firstTagSeen;
}
