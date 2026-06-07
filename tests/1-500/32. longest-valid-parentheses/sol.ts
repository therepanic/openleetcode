function longestValidParentheses(s: string): number {
  const st: number[] = [-1];
  let ans = 0;
  for (let i = 0; i < s.length; i++) {
    if (s[i] === "(") st.push(i);
    else {
      st.pop();
      if (st.length === 0) st.push(i);
      else ans = Math.max(ans, i - st[st.length - 1]);
    }
  }
  return ans;
}
