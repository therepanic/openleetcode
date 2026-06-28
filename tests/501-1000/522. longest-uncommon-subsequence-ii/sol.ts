function findLUSlength(strs: string[]): number {
  strs.sort((a, b) => b.length - a.length);

  const isSubsequence = (s: string, t: string): boolean => {
    let i = 0;
    for (const c of t) {
      if (i < s.length && s[i] === c) i++;
    }
    return i === s.length;
  };

  for (let i = 0; i < strs.length; i++) {
    let unique = true;
    for (let j = 0; j < strs.length; j++) {
      if (i === j) continue;
      if (isSubsequence(strs[i], strs[j])) {
        unique = false;
        break;
      }
    }
    if (unique) return strs[i].length;
  }

  return -1;
}
