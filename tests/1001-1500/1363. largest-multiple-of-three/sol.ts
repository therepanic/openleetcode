function largestMultipleOfThree(digits: number[]): string {
  const counts: number[] = Array(10).fill(0);
  for (const digit of digits) {
    counts[digit]++;
  }

  let sum = 0;
  for (let i = 0; i < 10; i++) {
    sum += i * counts[i];
  }
  const remainder = sum % 3;

  const removeSmallest = (group: number[], amount: number): boolean => {
    let amt = amount;
    for (const digit of group) {
      while (amt > 0 && counts[digit] > 0) {
        counts[digit]--;
        amt--;
      }
    }
    return amt === 0;
  };

  if (remainder === 1) {
    if (!removeSmallest([1, 4, 7], 1)) {
      removeSmallest([2, 5, 8], 2);
    }
  } else if (remainder === 2) {
    if (!removeSmallest([2, 5, 8], 1)) {
      removeSmallest([1, 4, 7], 2);
    }
  }

  let result = "";
  for (let i = 9; i >= 0; i--) {
    result += i.toString().repeat(counts[i]);
  }
  return result.startsWith("0") ? "0" : result;
}
