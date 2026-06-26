function arrayPairSum(nums: number[]): number {
  const bucket: number[] = new Array(20001).fill(0);
  for (const x of nums) {
    bucket[x + 10000]++;
  }
  let res = 0;
  let flag = true;
  for (let i = 0; i < 20001; i++) {
    while (bucket[i] > 0) {
      if (flag) {
        res += i - 10000;
      }
      flag = !flag;
      bucket[i]--;
    }
  }
  return res;
}
