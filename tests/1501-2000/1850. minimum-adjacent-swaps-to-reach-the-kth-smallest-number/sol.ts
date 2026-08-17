function getMinSwaps(num: string, k: number): number {
  let arr = num.split("");
  let target = num.split("");

  for (let i = 0; i < k; i++) {
    nextPermutation(target);
  }

  let swaps = 0;
  arr = num.split("");

  for (let i = 0; i < arr.length; i++) {
    if (arr[i] === target[i]) continue;

    let j = i;
    while (arr[j] !== target[i]) j++;

    while (j > i) {
      [arr[j], arr[j - 1]] = [arr[j - 1], arr[j]];
      j--;
      swaps++;
    }
  }

  return swaps;
}

function nextPermutation(arr: string[]): void {
  let i = arr.length - 2;
  while (i >= 0 && arr[i] >= arr[i + 1]) i--;
  if (i === -1) return;

  let j = arr.length - 1;
  while (arr[j] <= arr[i]) j--;

  [arr[i], arr[j]] = [arr[j], arr[i]];

  let left = i + 1,
    right = arr.length - 1;
  while (left < right) {
    [arr[left], arr[right]] = [arr[right], arr[left]];
    left++;
    right--;
  }
}
