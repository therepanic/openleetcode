function isPalindrome(s: string): boolean {
  const filtered: string[] = [];
  for (const ch of s)
    if (/^[a-z0-9]$/i.test(ch)) filtered.push(ch.toLowerCase());
  for (let i = 0, j = filtered.length - 1; i < j; i++, j--)
    if (filtered[i] !== filtered[j]) return false;
  return true;
}
