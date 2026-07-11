function gcdOfStrings(str1: string, str2: string): string {
  if (str1 + str2 !== str2 + str1) {
    return "";
  }

  function gcd(len1: number, len2: number): number {
    const minVal = Math.min(len1, len2);
    for (let i = minVal; i >= 1; i--) {
      if (len1 % i === 0 && len2 % i === 0) {
        return i;
      }
    }
    return 1;
  }

  return str1.substring(0, gcd(str1.length, str2.length));
}
