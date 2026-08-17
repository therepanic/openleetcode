function longestBeautifulSubstring(word: string): number {
  const n = word.length;
  let i = 0;
  let length = 0;

  while (i < n) {
    if (word[i] !== "a") {
      i++;
      continue;
    }

    let j = i;
    let unique = 1;
    while (j + 1 < n && word[j + 1] >= word[j]) {
      if (word[j + 1] !== word[j]) {
        unique++;
      }
      j++;
    }

    if (unique === 5) {
      length = Math.max(length, j - i + 1);
    }

    i = j + 1;
  }

  return length;
}
