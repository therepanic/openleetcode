function decodeString(s: string): string {
  let i = 0;

  function decode(): string {
    let res = "";
    let num = 0;
    while (i < s.length) {
      const c = s[i];
      if (!isNaN(parseInt(c))) {
        num = num * 10 + parseInt(c);
        i++;
      } else if (c === "[") {
        i++;
        const inner = decode();
        res += inner.repeat(num);
        num = 0;
      } else if (c === "]") {
        i++;
        return res;
      } else {
        res += c;
        i++;
      }
    }
    return res;
  }

  return decode();
}
