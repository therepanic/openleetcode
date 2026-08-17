function longestNiceSubstring(s: string): string {
  const lenS = s.length;
  if (lenS <= 1) return "";

  const charToFreqMap: Map<string, number> = new Map();
  for (const c of s) {
    charToFreqMap.set(c, (charToFreqMap.get(c) || 0) + 1);
  }

  let isBroken = false;
  let i = 0;
  while (i < s.length) {
    const ch = s[i];
    if (ch >= "a" && ch <= "z" && charToFreqMap.has(ch.toUpperCase())) {
      // pass
    } else if (ch >= "A" && ch <= "Z" && charToFreqMap.has(ch.toLowerCase())) {
      // pass
    } else {
      isBroken = true;
      break;
    }
    i++;
  }

  if (!isBroken) return s;

  const longestNiceSubstr1 = longestNiceSubstring(s.substring(0, i));
  const longestNiceSubstr2 = longestNiceSubstring(s.substring(i + 1));

  return longestNiceSubstr1.length >= longestNiceSubstr2.length
    ? longestNiceSubstr1
    : longestNiceSubstr2;
}
