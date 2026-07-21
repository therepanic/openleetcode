function arrangeWords(text: string): string {
  let s = text.split(" ");
  s.sort((a, b) => a.length - b.length);
  s = s.map((i) => i.toLowerCase());
  s[0] = s[0][0].toUpperCase() + s[0].slice(1);
  return s.join(" ");
}
