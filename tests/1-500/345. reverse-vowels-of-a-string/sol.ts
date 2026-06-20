function reverseVowels(s: string): string {
  const vowels = new Set("aeiouAEIOU");
  const chars = s.split("");
  let i = 0,
    j = chars.length - 1;
  while (i < j) {
    while (i < j && !vowels.has(chars[i])) {
      i++;
    }
    while (i < j && !vowels.has(chars[j])) {
      j--;
    }
    [chars[i], chars[j]] = [chars[j], chars[i]];
    i++;
    j--;
  }
  return chars.join("");
}
