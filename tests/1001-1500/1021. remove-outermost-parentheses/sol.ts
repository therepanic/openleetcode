function removeOuterParentheses(s: string): string {
  let res = "";
  let balance = 0;
  let start = 0;
  for (let i = 0; i < s.length; i++) {
    if (s[i] === "(") {
      balance++;
    } else {
      balance--;
    }
    if (balance === 0) {
      res += s.substring(start + 1, i);
      start = i + 1;
    }
  }
  return res;
}
