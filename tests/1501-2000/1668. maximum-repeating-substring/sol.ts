function maxRepeating(sequence: string, word: string): number {
  let temp = word;
  let res = 0;
  while (sequence.includes(temp)) {
    res++;
    temp += word;
  }
  return res;
}
