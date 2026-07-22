function freqAlphabets(s: string): string {
  const decoded: string[] = [];
  let index = 0;
  while (index < s.length) {
    if (index + 2 < s.length && s[index + 2] === "#") {
      const num = parseInt(s.substring(index, index + 2));
      decoded.push(String.fromCharCode("a".charCodeAt(0) + num - 1));
      index += 3;
    } else {
      const num = parseInt(s[index]);
      decoded.push(String.fromCharCode("a".charCodeAt(0) + num - 1));
      index += 1;
    }
  }
  return decoded.join("");
}
