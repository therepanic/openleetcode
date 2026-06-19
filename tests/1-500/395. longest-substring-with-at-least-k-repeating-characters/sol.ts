function longestSubstring(s: string, k: number): number {
  let longestLen = 0;
  const n = s.length;

  for (
    let targetUniqueChars = 1;
    targetUniqueChars <= 26;
    targetUniqueChars++
  ) {
    const charFreq: number[] = new Array(26).fill(0);
    let uniqueChars = 0;
    let charsMeetingKFreq = 0;
    let left = 0;

    for (let right = 0; right < n; right++) {
      const currIdx = s.charCodeAt(right) - "a".charCodeAt(0);

      if (charFreq[currIdx] === 0) {
        uniqueChars++;
      }
      if (charFreq[currIdx] === k - 1) {
        charsMeetingKFreq++;
      }
      charFreq[currIdx]++;

      while (uniqueChars > targetUniqueChars) {
        const leftIdx = s.charCodeAt(left) - "a".charCodeAt(0);

        if (charFreq[leftIdx] === 1) {
          uniqueChars--;
        }
        if (charFreq[leftIdx] === k) {
          charsMeetingKFreq--;
        }
        charFreq[leftIdx]--;
        left++;
      }

      if (
        uniqueChars === targetUniqueChars &&
        charsMeetingKFreq === uniqueChars
      ) {
        longestLen = Math.max(longestLen, right - left + 1);
      }
    }
  }

  return longestLen;
}
