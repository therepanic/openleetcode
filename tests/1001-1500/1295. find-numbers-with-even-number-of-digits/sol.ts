function findNumbers(nums: number[]): number {
  let count = 0;
  for (const i of nums) {
    const msb = Math.floor(Math.log2(i));
    let digits = Math.floor(msb * 0.30103) + 1;
    if (i >= Math.pow(10, digits)) {
      digits++;
    }
    if (digits % 2 === 0) {
      count++;
    }
  }
  return count;
}
