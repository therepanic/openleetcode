function diStringMatch(s: string): number[] {
  let low = 0,
    high = s.length;
  const result: number[] = new Array(s.length + 1);
  for (let i = 0; i < s.length; i++) {
    if (s[i] === "I") {
      result[i] = low++;
    } else {
      result[i] = high--;
    }
  }
  result[s.length] = low;
  return result;
}
