function compress(chars: string[]): number {
  let i = 0,
    j = 0;
  while (j < chars.length) {
    const c = chars[j];
    let count = 0;
    while (j < chars.length && chars[j] === c) {
      j++;
      count++;
    }
    chars[i++] = c;
    if (count > 1) {
      for (const ch of count.toString()) {
        chars[i++] = ch;
      }
    }
  }
  return i;
}
