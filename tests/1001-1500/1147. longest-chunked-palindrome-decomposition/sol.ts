function longestDecomposition(text: string): number {
  let i = 0,
    j = text.length - 1,
    n = 0,
    count = 0;
  while (i <= j) {
    if (text[i] === text[j]) {
      if (text.substring(i, i + n + 1) === text.substring(j, j + n + 1)) {
        count += 2;
        i += n + 1;
        j -= 1;
        n = 0;
        continue;
      }
    }
    j -= 1;
    n += 1;
  }
  return i === j + 1 ? count : count - 1;
}
