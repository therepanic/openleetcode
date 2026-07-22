function removePalindromeSub(s: string): number {
  return s === s.split("").reverse().join("") ? 1 : 2;
}
