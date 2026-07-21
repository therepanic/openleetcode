function maximumSum(arr: number[]): number {
  const n = arr.length;
  if (n === 1) {
    return arr[0];
  }

  let maxNoDelete = arr[0];
  let maxOneDelete = arr[0];
  let result = arr[0];

  for (let i = 1; i < n; i++) {
    const prevNoDelete = maxNoDelete;
    maxNoDelete = Math.max(maxNoDelete + arr[i], arr[i]);
    maxOneDelete = Math.max(maxOneDelete + arr[i], prevNoDelete);
    result = Math.max(result, maxNoDelete, maxOneDelete);
  }

  return result;
}
