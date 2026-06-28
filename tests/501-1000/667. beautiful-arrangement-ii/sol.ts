function constructArray(n: number, k: number): number[] {
  const ans: number[] = [];
  for (let i = 1; i <= n - k; i++) {
    ans.push(i);
  }
  for (let i = 0; i < k; i++) {
    const diff = Math.floor(i / 2) + 1;
    if (i % 2 === 0) {
      ans.push(n - diff + 1);
    } else {
      ans.push(n - k + diff);
    }
  }
  return ans;
}
