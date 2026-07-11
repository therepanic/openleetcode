function uniqueMorseRepresentations(words: string[]): number {
  const storage = [
    ".-",
    "-...",
    "-.-.",
    "-..",
    ".",
    "..-.",
    "--.",
    "....",
    "..",
    ".---",
    "-.-",
    ".-..",
    "--",
    "-.",
    "---",
    ".--.",
    "--.-",
    ".-.",
    "...",
    "-",
    "..-",
    "...-",
    ".--",
    "-..-",
    "-.--",
    "--..",
  ];

  const st = new Set<string>();

  for (const word of words) {
    let temp = "";
    for (const ch of word) {
      temp += storage[ch.charCodeAt(0) - "a".charCodeAt(0)];
    }
    st.add(temp);
  }

  return st.size;
}
