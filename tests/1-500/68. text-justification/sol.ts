function fullJustify(words: string[], maxWidth: number): string[] {
  const res: string[] = [];
  let i = 0;

  while (i < words.length) {
    let j = i;
    let lineLen = 0;
    while (
      j < words.length &&
      lineLen + words[j].length + (j - i) <= maxWidth
    ) {
      lineLen += words[j].length;
      j++;
    }

    const spaces = maxWidth - lineLen;
    const gaps = j - i - 1;
    let line = "";

    if (j === words.length || gaps === 0) {
      for (let k = i; k < j; k++) {
        if (k > i) line += " ";
        line += words[k];
      }
      line += " ".repeat(maxWidth - line.length);
    } else {
      const each = Math.floor(spaces / gaps);
      let extra = spaces % gaps;
      for (let k = i; k < j; k++) {
        line += words[k];
        if (k < j - 1) {
          const count = each + (extra > 0 ? 1 : 0);
          line += " ".repeat(count);
          if (extra > 0) extra--;
        }
      }
    }

    res.push(line);
    i = j;
  }

  return res;
}
