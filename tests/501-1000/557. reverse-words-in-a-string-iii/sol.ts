function reverseWords(s: string): string {
  const words = s.split(" ");
  const reversedWords = words.map((word) => word.split("").reverse().join(""));
  return reversedWords.join(" ");
}
