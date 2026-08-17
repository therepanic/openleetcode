function areSentencesSimilar(sentence1: string, sentence2: string): boolean {
  const s1 = sentence1.split(" ");
  const s2 = sentence2.split(" ");

  let l1 = 0,
    l2 = 0,
    r1 = s1.length - 1,
    r2 = s2.length - 1;

  while (l1 <= r1 && l2 <= r2) {
    if (s1[l1] === s2[l2]) {
      l1++;
      l2++;
    } else if (s1[r1] === s2[r2]) {
      r1--;
      r2--;
    } else {
      return false;
    }
  }

  return true;
}
