function checkPalindromeFormation(a: string, b: string): boolean {
  const check = (a: string, b: string): boolean => {
    let i = 0,
      j = a.length - 1;
    while (i < j && a[i] === b[j]) {
      i++;
      j--;
    }
    const subA = a.substring(i, j + 1);
    const subB = b.substring(i, j + 1);
    return isPalindrome(subA) || isPalindrome(subB);
  };

  const isPalindrome = (s: string): boolean => {
    return s === s.split("").reverse().join("");
  };

  return check(a, b) || check(b, a);
}
