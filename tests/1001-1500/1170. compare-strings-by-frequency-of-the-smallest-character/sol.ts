function numSmallerByFrequency(queries: string[], words: string[]): number[] {
  const f = (s: string): number => {
    let minChar = "z";
    let count = 0;
    for (const char of s) {
      if (char < minChar) {
        minChar = char;
        count = 1;
      } else if (char === minChar) {
        count++;
      }
    }
    return count;
  };

  const buckets = new Array(12).fill(0);
  for (const w of words) {
    buckets[f(w)]++;
  }
  for (let i = 9; i >= 0; i--) {
    buckets[i] += buckets[i + 1];
  }

  return queries.map((q) => buckets[f(q) + 1]);
}
