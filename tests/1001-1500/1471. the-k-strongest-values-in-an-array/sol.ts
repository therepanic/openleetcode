function getStrongest(arr: number[], k: number): number[] {
  arr.sort((a, b) => a - b);
  const m = arr[Math.floor((arr.length - 1) / 2)];

  let left = 0,
    right = arr.length - 1;
  const result: number[] = [];
  for (let i = 0; i < k; i++) {
    if (Math.abs(arr[right] - m) >= Math.abs(arr[left] - m)) {
      result.push(arr[right]);
      right--;
    } else {
      result.push(arr[left]);
      left++;
    }
  }
  return result;
}
