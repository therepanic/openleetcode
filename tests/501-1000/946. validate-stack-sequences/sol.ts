function validateStackSequences(pushed: number[], popped: number[]): boolean {
  const st: number[] = [];
  let j = 0;
  for (const x of pushed) {
    st.push(x);
    while (
      st.length > 0 &&
      j < popped.length &&
      st[st.length - 1] === popped[j]
    ) {
      st.pop();
      j++;
    }
  }
  return j === popped.length;
}
