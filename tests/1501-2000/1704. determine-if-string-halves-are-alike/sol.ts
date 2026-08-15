function halvesAreAlike(s: string): boolean {
  const vowels = "aeiouAEIOU";
  const mid = s.length >> 1;
  let count = 0;
  for (let i = 0; i < mid; i++) {
    if (vowels.includes(s[i])) count++;
  }
  for (let i = mid; i < s.length; i++) {
    if (vowels.includes(s[i])) count--;
  }
  return count === 0;
}
