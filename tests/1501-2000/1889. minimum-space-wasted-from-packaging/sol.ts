function minWastedSpace(packages: number[], boxes: number[][]): number {
  packages.sort((a, b) => a - b);
  const n = packages.length;
  const totalPackageSum = packages.reduce((a, b) => a + b, 0);

  let minGrossArea = Number.MAX_SAFE_INTEGER;

  for (const supplierBoxes of boxes) {
    supplierBoxes.sort((a, b) => a - b);
    if (supplierBoxes[supplierBoxes.length - 1] < packages[n - 1]) continue;

    let grossArea = 0;
    let lowIdx = 0;

    for (const b of supplierBoxes) {
      const highIdx = upperBound(packages, b, lowIdx);
      const count = highIdx - lowIdx;
      if (count > 0) {
        grossArea += b * count;
        lowIdx = highIdx;
      }
      if (lowIdx === n) break;
    }

    if (grossArea < minGrossArea) minGrossArea = grossArea;
  }

  if (minGrossArea === Number.MAX_SAFE_INTEGER) return -1;
  return (minGrossArea - totalPackageSum) % 1000000007;
}

function upperBound(arr: number[], target: number, lo: number): number {
  let l = lo;
  let h = arr.length;
  while (l < h) {
    const mid = l + Math.floor((h - l) / 2);
    if (arr[mid] <= target) l = mid + 1;
    else h = mid;
  }
  return l;
}
