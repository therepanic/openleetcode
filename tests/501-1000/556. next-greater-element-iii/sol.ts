function nextGreaterElement(n: number): number {
  const digits: string[] = n.toString().split("");
  const length: number = digits.length;
  let pivot: number = -1;

  for (let i = length - 2; i >= 0; i--) {
    if (digits[i] < digits[i + 1]) {
      pivot = i;
      break;
    }
  }

  if (pivot === -1) {
    return -1;
  }

  for (let i = length - 1; i > pivot; i--) {
    if (digits[i] > digits[pivot]) {
      [digits[i], digits[pivot]] = [digits[pivot], digits[i]];
      break;
    }
  }

  let left = pivot + 1;
  let right = length - 1;
  while (left < right) {
    [digits[left], digits[right]] = [digits[right], digits[left]];
    left++;
    right--;
  }

  const result: number = parseInt(digits.join(""));
  return result <= 2147483647 ? result : -1;
}
