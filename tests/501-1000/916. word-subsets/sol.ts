function wordSubsets(words1: string[], words2: string[]): string[] {
  const maxCharFreq: number[] = new Array(26).fill(0);
  let tempCharFreq: number[] = new Array(26).fill(0);

  for (const word of words2) {
    for (const ch of word) {
      tempCharFreq[ch.charCodeAt(0) - "a".charCodeAt(0)]++;
    }
    for (let i = 0; i < 26; i++) {
      maxCharFreq[i] = Math.max(maxCharFreq[i], tempCharFreq[i]);
    }
    tempCharFreq = new Array(26).fill(0);
  }

  const universalWords: string[] = [];

  for (const word of words1) {
    for (const ch of word) {
      tempCharFreq[ch.charCodeAt(0) - "a".charCodeAt(0)]++;
    }
    let isUniversal = true;
    for (let i = 0; i < 26; i++) {
      if (maxCharFreq[i] > tempCharFreq[i]) {
        isUniversal = false;
        break;
      }
    }
    if (isUniversal) {
      universalWords.push(word);
    }
    tempCharFreq = new Array(26).fill(0);
  }

  return universalWords;
}
