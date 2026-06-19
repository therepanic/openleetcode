function reversePairs(nums: number[]): number {
  function sortCount(arr: number[]): [number[], number] {
    const n = arr.length;
    if (n <= 1) {
      return [arr, 0];
    }

    const mid = Math.floor(n / 2);
    const [left, leftCount] = sortCount(arr.slice(0, mid));
    const [right, rightCount] = sortCount(arr.slice(mid));

    let count = leftCount + rightCount;

    let j = 0;
    for (const x of left) {
      while (j < right.length && x > 2 * right[j]) {
        j++;
      }
      count += j;
    }

    const merged: number[] = [];
    let i = 0;
    j = 0;
    while (i < left.length && j < right.length) {
      if (left[i] <= right[j]) {
        merged.push(left[i]);
        i++;
      } else {
        merged.push(right[j]);
        j++;
      }
    }

    if (i < left.length) {
      merged.push(...left.slice(i));
    }
    if (j < right.length) {
      merged.push(...right.slice(j));
    }

    return [merged, count];
  }

  return sortCount(nums)[1];
}
