function pancakeSort(arr: number[]): number[] {
  const n = arr.length;
  const result: number[] = [];

  for (let i = 0; i < n; i++) {
    const target = n - i;
    let position = 0;

    for (let j = 0; j < n - i; j++) {
      if (arr[j] === target) {
        position = j;
        break;
      }
    }

    if (position === n - i - 1) {
      continue;
    }

    if (position > 0) {
      result.push(position + 1);
      reverse(arr, 0, position);
    }

    result.push(n - i);
    reverse(arr, 0, n - i - 1);
  }

  return result;
}

function reverse(arr: number[], left: number, right: number): void {
  while (left < right) {
    const temp = arr[left];
    arr[left] = arr[right];
    arr[right] = temp;
    left++;
    right--;
  }
}
