function addToArrayForm(num: number[], k: number): number[] {
  const out: number[] = [];
  let i = num.length - 1;
  let carry = k;
  while (i >= 0 || carry > 0) {
    if (i >= 0) {
      carry += num[i];
      i--;
    }
    out.push(carry % 10);
    carry = Math.floor(carry / 10);
  }
  if (out.length === 0) {
    return [0];
  }
  return out.reverse();
}
