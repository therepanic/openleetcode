function monotoneIncreasingDigits(n: number): number {
  const s: string[] = n.toString().split("");
  let mark: number = s.length;
  for (let i = s.length - 1; i > 0; i--) {
    if (s[i] < s[i - 1]) {
      s[i - 1] = (parseInt(s[i - 1]) - 1).toString();
      mark = i;
    }
  }
  for (let i = mark; i < s.length; i++) {
    s[i] = "9";
  }
  return parseInt(s.join(""));
}
