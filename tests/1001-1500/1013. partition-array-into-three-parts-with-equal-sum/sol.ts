function canThreePartsEqualSum(arr: number[]): boolean {
  const total = arr.reduce((a, b) => a + b, 0);
  if (total % 3 !== 0) {
    return false;
  }
  const target = total / 3;
  let currentSum = 0;
  let partitions = 0;
  for (let i = 0; i < arr.length; i++) {
    currentSum += arr[i];
    if (currentSum === target) {
      partitions++;
      currentSum = 0;
      if (partitions === 2 && i < arr.length - 1) {
        return true;
      }
    }
  }
  return false;
}
