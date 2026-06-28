function countSubstrings(s: string): number {
  let count = 0;

  const expand = (left: number, right: number): number => {
    let res = 0;
    while (left >= 0 && right < s.length && s[left] === s[right]) {
      res++;
      left--;
      right++;
    }
    return res;
  };

  for (let i = 0; i < s.length; i++) {
    count += expand(i, i);
    count += expand(i, i + 1);
  }

  return count;
}
