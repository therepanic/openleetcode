function numberOfSteps(num: number): number {
  if (num === 0) return 0;
  const bitLen = Math.floor(Math.log2(num)) + 1;
  const ones = num.toString(2).split("0").join("").length;
  return bitLen - 1 + ones;
}
