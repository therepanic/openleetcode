function findTheDistanceValue(
  arr1: number[],
  arr2: number[],
  d: number,
): number {
  arr2.sort((a, b) => a - b);
  let count = 0;
  for (const num of arr1) {
    const leftIndex = lowerBound(arr2, num - d);
    const rightIndex = upperBound(arr2, num + d);
    if (leftIndex === rightIndex) {
      count++;
    }
  }
  return count;
}

function lowerBound(arr: number[], target: number): number {
  let left = 0,
    right = arr.length;
  while (left < right) {
    const mid = left + Math.floor((right - left) / 2);
    if (arr[mid] < target) {
      left = mid + 1;
    } else {
      right = mid;
    }
  }
  return left;
}

function upperBound(arr: number[], target: number): number {
  let left = 0,
    right = arr.length;
  while (left < right) {
    const mid = left + Math.floor((right - left) / 2);
    if (arr[mid] <= target) {
      left = mid + 1;
    } else {
      right = mid;
    }
  }
  return left;
}
