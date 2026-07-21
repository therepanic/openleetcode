function mctFromLeafValues(arr: number[]): number {
  let result = 0;
  const st: number[] = [Infinity];

  for (const a of arr) {
    while (st[st.length - 1] <= a) {
      const mid = st.pop()!;
      result += mid * Math.min(st[st.length - 1], a);
    }
    st.push(a);
  }

  let first = st.pop()!;
  while (st.length > 1) {
    result += first * st[st.length - 1];
    first = st.pop()!;
  }

  return result;
}
