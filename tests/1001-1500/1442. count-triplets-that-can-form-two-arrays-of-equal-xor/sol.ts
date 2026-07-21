function countTriplets(arr: number[]): number {
  let totalCount = 0;
  let prefixXor = 0;
  const prefixCount: Map<number, number> = new Map([[0, 1]]);
  const indexSum: Map<number, number> = new Map([[0, 0]]);
  for (let k = 1; k <= arr.length; k++) {
    prefixXor ^= arr[k - 1];
    if (prefixCount.has(prefixXor)) {
      totalCount +=
        prefixCount.get(prefixXor)! * (k - 1) - indexSum.get(prefixXor)!;
    } else {
      prefixCount.set(prefixXor, 0);
      indexSum.set(prefixXor, 0);
    }
    prefixCount.set(prefixXor, prefixCount.get(prefixXor)! + 1);
    indexSum.set(prefixXor, indexSum.get(prefixXor)! + k);
  }
  return totalCount;
}
