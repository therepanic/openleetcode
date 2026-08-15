function reversePrefix(word: string, ch: string): string {
  const idx = word.indexOf(ch);
  if (idx === -1) {
    return word;
  }
  const prefix = word.substring(0, idx + 1);
  const reversed = prefix.split("").reverse().join("");
  return reversed + word.substring(idx + 1);
}
