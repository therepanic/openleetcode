function longestPalindrome(s: string): string {
  if (s.length === 0) {
    return "";
  }

  let start = 0;
  let best = 1;
  for (let i = 0; i < s.length; i++) {
    const len1 = expandLongestPalindrome(s, i, i);
    const len2 = expandLongestPalindrome(s, i, i + 1);
    const len = Math.max(len1, len2);
    if (len > best) {
      best = len;
      start = i - Math.floor((len - 1) / 2);
    }
  }

  return s.slice(start, start + best);
}

function expandLongestPalindrome(
  s: string,
  left: number,
  right: number,
): number {
  while (left >= 0 && right < s.length && s[left] === s[right]) {
    left--;
    right++;
  }
  return right - left - 1;
}
