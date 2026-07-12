function toGoatLatin(sentence: string): string {
  const vowels = new Set(["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]);
  const words = sentence.split(" ");
  const ans: string[] = [];
  for (let i = 0; i < words.length; i++) {
    const word = words[i];
    let goat: string;
    if (vowels.has(word[0])) {
      goat = word + "ma";
    } else {
      goat = word.substring(1) + word[0] + "ma";
    }
    goat += "a".repeat(i + 1);
    ans.push(goat);
  }
  return ans.join(" ");
}
