function reorderSpaces(text: string): string {
  const words = text.trim().split(/\s+/);
  const total = (text.match(/ /g) || []).length;
  if (words.length === 1) {
    return words[0] + " ".repeat(total);
  }
  const gap = Math.floor(total / (words.length - 1));
  const extra = total % (words.length - 1);
  return words.join(" ".repeat(gap)) + " ".repeat(extra);
}
