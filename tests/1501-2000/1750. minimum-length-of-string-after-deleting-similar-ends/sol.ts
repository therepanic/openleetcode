function minimumLength(s: string): number {
  let left = 0;
  let right = s.length - 1;
  while (left < right && s[left] === s[right]) {
    const ch = s[left];
    while (left <= right && s[left] === ch) {
      left++;
    }
    while (left <= right && s[right] === ch) {
      right--;
    }
  }
  return Math.max(0, right - left + 1);
}
