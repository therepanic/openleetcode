function largestMerge(word1: string, word2: string): string {
  let res = "";
  let i = 0,
    j = 0;
  while (i < word1.length && j < word2.length) {
    if (word1[i] > word2[j]) {
      res += word1[i];
      i++;
    } else if (word1[i] < word2[j]) {
      res += word2[j];
      j++;
    } else {
      let p = i,
        q = j;
      while (p < word1.length && q < word2.length && word1[p] === word2[q]) {
        p++;
        q++;
      }
      if (q === word2.length || (p < word1.length && word1[p] > word2[q])) {
        res += word1[i];
        i++;
      } else {
        res += word2[j];
        j++;
      }
    }
  }
  while (i < word1.length) {
    res += word1[i];
    i++;
  }
  while (j < word2.length) {
    res += word2[j];
    j++;
  }
  return res;
}
