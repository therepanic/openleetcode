function isPrefixOfWord(sentence: string, searchWord: string): number {
  const words = sentence.split(" ");
  for (let i = 0; i < words.length; i++) {
    if (words[i].startsWith(searchWord)) {
      return i + 1;
    }
  }
  return -1;
}
