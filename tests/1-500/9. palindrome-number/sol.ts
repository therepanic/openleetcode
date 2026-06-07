function isPalindrome(x: number): boolean {
  if (x < 0) {
    return false;
  }

  let rev = 0;
  let num = x;
  while (num !== 0) {
    rev = rev * 10 + (num % 10);
    num = Math.trunc(num / 10);
  }
  return rev === x;
}
