function kSimilarity(s1: string, s2: string): number {
  const queue: string[] = [s1];
  const seen: Set<string> = new Set();
  let answ: number = 0;

  while (queue.length > 0) {
    const size = queue.length;
    for (let k = 0; k < size; k++) {
      const str = queue.shift()!;
      if (str === s2) return answ;

      let i = 0;
      while (str[i] === s2[i]) i++;

      for (let j = i + 1; j < str.length; j++) {
        if (str[i] === s2[j] && s2[j] !== s1[j]) {
          const newStr =
            str.substring(0, i) +
            str[j] +
            str.substring(i + 1, j) +
            str[i] +
            str.substring(j + 1);
          if (!seen.has(newStr)) {
            seen.add(newStr);
            queue.push(newStr);
          }
        }
      }
    }
    answ++;
  }
  return answ;
}
