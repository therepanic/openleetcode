function numOfSubarrays(arr: number[]): number {
  let oddCount = 0;
  let prefixSum = 0;
  const mod = 1000000007;
  for (const a of arr) {
    prefixSum += a;
    oddCount += prefixSum % 2;
  }
  oddCount += (arr.length - oddCount) * oddCount;
  return oddCount % mod;
}
