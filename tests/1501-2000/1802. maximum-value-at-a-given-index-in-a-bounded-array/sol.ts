function maxValue(n: number, index: number, maxSum: number): number {
  let l = 0,
    r = maxSum,
    result = 1;
  while (l <= r) {
    const mid = Math.floor((l + r) / 2);
    if (isValid(mid, n, index, maxSum)) {
      result = mid;
      l = mid + 1;
    } else {
      r = mid - 1;
    }
  }
  return result;
}

function isValid(
  mid: number,
  n: number,
  index: number,
  maxSum: number,
): boolean {
  const leftCount = index;
  let left: number;
  if (mid > leftCount) {
    left = Math.floor(((mid - leftCount + mid - 1) * leftCount) / 2);
  } else {
    const ones = leftCount - (mid - 1);
    left = (mid * (mid - 1)) / 2 + ones;
  }

  const rightCount = n - index - 1;
  let right: number;
  if (mid > rightCount) {
    right = Math.floor(((mid - 1 + mid - rightCount) * rightCount) / 2);
  } else {
    const ones = rightCount - (mid - 1);
    right = (mid * (mid - 1)) / 2 + ones;
  }

  return left + mid + right <= maxSum;
}
