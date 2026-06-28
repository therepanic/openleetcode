function validPalindrome(s: string): boolean {
  const isPalindrome = (l: number, r: number): boolean => {
    while (l < r) {
      if (s[l] !== s[r]) {
        return false;
      }
      l++;
      r--;
    }
    return true;
  };

  let left = 0;
  let right = s.length - 1;
  while (left < right) {
    if (s[left] !== s[right]) {
      return isPalindrome(left + 1, right) || isPalindrome(left, right - 1);
    }
    left++;
    right--;
  }
  return true;
}
