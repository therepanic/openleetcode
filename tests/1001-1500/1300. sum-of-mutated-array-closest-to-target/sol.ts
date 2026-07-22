function findBestValue(arr: number[], target: number): number {
  const getMutatedSum = (value: number): number => {
    return arr.reduce((sum, x) => sum + Math.min(x, value), 0);
  };

  let low = 0;
  let high = Math.max(...arr);
  let result = high;
  let minDiff = Infinity;

  while (low <= high) {
    const mid = Math.floor((low + high) / 2);
    const currSum = getMutatedSum(mid);
    const diff = Math.abs(currSum - target);

    if (diff < minDiff || (diff === minDiff && mid < result)) {
      minDiff = diff;
      result = mid;
    }

    if (currSum < target) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }

  return result;
}
