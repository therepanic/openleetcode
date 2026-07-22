function numSubmat(mat: number[][]): number {
  const r = mat.length;
  const c = mat[0].length;
  const h: number[] = new Array(c).fill(0);
  let ans = 0;

  for (let i = 0; i < r; i++) {
    for (let j = 0; j < c; j++) {
      h[j] = mat[i][j] === 1 ? h[j] + 1 : 0;
    }

    const sumv: number[] = new Array(c).fill(0);
    const st: number[] = [];

    for (let j = 0; j < c; j++) {
      while (st.length > 0 && h[st[st.length - 1]] >= h[j]) {
        st.pop();
      }

      if (st.length > 0) {
        const p = st[st.length - 1];
        sumv[j] = sumv[p] + h[j] * (j - p);
      } else {
        sumv[j] = h[j] * (j + 1);
      }

      st.push(j);
      ans += sumv[j];
    }
  }

  return ans;
}
