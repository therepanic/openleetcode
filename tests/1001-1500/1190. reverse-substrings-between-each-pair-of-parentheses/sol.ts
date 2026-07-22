function reverseParentheses(s: string): string {
  let i = 0;

  function helper(): string {
    let ans = "";
    while (i < s.length) {
      if (s[i] === "(") {
        i++;
        ans += helper();
      } else if (s[i] === ")") {
        i++;
        return ans.split("").reverse().join("");
      } else {
        ans += s[i];
        i++;
      }
    }
    return ans;
  }

  return helper();
}
