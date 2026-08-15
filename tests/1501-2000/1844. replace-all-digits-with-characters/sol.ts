function replaceDigits(s: string): string {
  const chars = s.split("");
  for (let i = 1; i < chars.length; i += 2) {
    const ch = chars[i - 1];
    const digit = parseInt(chars[i]);
    chars[i] = String.fromCharCode(ch.charCodeAt(0) + digit);
  }
  return chars.join("");
}
