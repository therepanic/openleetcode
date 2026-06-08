function addBinary(a: string, b: string): string {
  let i = a.length - 1;
  let j = b.length - 1;
  let carry = 0;
  const res: string[] = [];

  while (i >= 0 || j >= 0 || carry > 0) {
    let sum = carry;
    if (i >= 0) {
      sum += a.charCodeAt(i) - 48;
      i--;
    }
    if (j >= 0) {
      sum += b.charCodeAt(j) - 48;
      j--;
    }
    res.push(String(sum % 2));
    carry = Math.floor(sum / 2);
  }

  return res.reverse().join("");
}
