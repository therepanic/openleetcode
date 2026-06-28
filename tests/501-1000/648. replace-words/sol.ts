function replaceWords(dictionary: string[], sentence: string): string {
  const trie: { [key: string]: any } = { "*": false };
  const arr: string[] = sentence.split(" ");

  function addInTrie(trie: { [key: string]: any }, word: string): void {
    let n = trie;
    for (const letter of word) {
      if (!n[letter]) {
        n[letter] = { "*": false };
      }
      n = n[letter];
    }
    n["*"] = true;
  }

  function getReplacement(trie: { [key: string]: any }, word: string): string {
    let n = trie;
    for (let i = 0; i < word.length; i++) {
      if (n["*"] === true) {
        return word.substring(0, i);
      }
      const letter = word[i];
      if (!n[letter]) {
        break;
      }
      n = n[letter];
    }
    return word;
  }

  for (const word of dictionary) {
    addInTrie(trie, word);
  }

  for (let i = 0; i < arr.length; i++) {
    arr[i] = getReplacement(trie, arr[i]);
  }

  return arr.join(" ");
}
