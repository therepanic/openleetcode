function numTriplets(nums1: number[], nums2: number[]): number {
  const countPairs = (numsA: number[], numsB: number[]): number => {
    const freq: Map<number, number> = new Map();
    for (let i = 0; i < numsB.length; i++) {
      for (let j = i + 1; j < numsB.length; j++) {
        const prod = numsB[i] * numsB[j];
        freq.set(prod, (freq.get(prod) || 0) + 1);
      }
    }
    let count = 0;
    for (const num of numsA) {
      count += freq.get(num * num) || 0;
    }
    return count;
  };
  return countPairs(nums1, nums2) + countPairs(nums2, nums1);
}
