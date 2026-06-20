function characterReplacement(s: string, k: number): number {
  let maxCount = 0;
  let left = 0;
  const freq: { [key: string]: number } = {};

  for (let right = 0; right < s.length; right++) {
    freq[s[right]] = (freq[s[right]] || 0) + 1;
    maxCount = Math.max(maxCount, freq[s[right]]);

    if (right - left + 1 - maxCount > k) {
      freq[s[left]]--;
      left++;
    }
  }

  return s.length - left;
}
