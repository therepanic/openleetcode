function decodeAtIndex(s: string, k: number): string {
  let size: number = 0;
  for (const ch of s) {
    if (ch >= "0" && ch <= "9") {
      size *= parseInt(ch);
    } else {
      size++;
    }
  }

  for (let i = s.length - 1; i >= 0; i--) {
    const ch = s[i];
    k %= size;
    if ((k === 0 && ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z")) {
      return ch;
    }
    if (ch >= "0" && ch <= "9") {
      size = Math.floor(size / parseInt(ch));
    } else {
      size--;
    }
  }
  return "";
}
