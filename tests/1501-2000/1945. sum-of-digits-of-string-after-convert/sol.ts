function getLucky(s: string, k: number): number {
  let res = "";
  for (const c of s) {
    res += (c.charCodeAt(0) - "a".charCodeAt(0) + 1).toString();
  }
  for (let i = 0; i < k; i++) {
    let sum = 0;
    for (const c of res) {
      sum += parseInt(c);
    }
    res = sum.toString();
  }
  return parseInt(res);
}
