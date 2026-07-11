function relativeSortArray(arr1: number[], arr2: number[]): number[] {
  const freq: number[] = new Array(1001).fill(0);
  for (const num of arr1) {
    freq[num]++;
  }
  let idx = 0;
  for (const num of arr2) {
    while (freq[num] > 0) {
      arr1[idx++] = num;
      freq[num]--;
    }
  }
  for (let num = 0; num < 1001; num++) {
    while (freq[num] > 0) {
      arr1[idx++] = num;
      freq[num]--;
    }
  }
  return arr1;
}
