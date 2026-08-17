function minSwaps(s: string): number {
  const count0 = (s.match(/0/g) || []).length;
  const count1 = (s.match(/1/g) || []).length;

  if (Math.abs(count0 - count1) > 1) return -1;

  let mismatch0 = 0;
  let mismatch1 = 0;

  for (let i = 0; i < s.length; i++) {
    const expected0 = i % 2 === 0 ? "0" : "1";
    const expected1 = i % 2 === 0 ? "1" : "0";
    if (s[i] !== expected0) mismatch0++;
    if (s[i] !== expected1) mismatch1++;
  }

  if (count0 === count1)
    return Math.min(Math.floor(mismatch0 / 2), Math.floor(mismatch1 / 2));
  if (count0 > count1) return Math.floor(mismatch0 / 2);
  return Math.floor(mismatch1 / 2);
}
