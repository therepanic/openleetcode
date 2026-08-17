function checkIfPangram(sentence: string): boolean {
  if (sentence.length < 26) return false;

  for (let i = 0; i < 26; i++) {
    if (!sentence.includes(String.fromCharCode(97 + i))) return false;
  }
  return true;
}
