function minOperations(target: number[], arr: number[]): number {
  const targetIndexMap: Map<number, number> = new Map();
  target.forEach((num, i) => targetIndexMap.set(num, i));

  const transformedArr: number[] = [];
  for (const num of arr) {
    if (targetIndexMap.has(num)) {
      transformedArr.push(targetIndexMap.get(num)!);
    }
  }

  const lis: number[] = [];
  for (const index of transformedArr) {
    let pos = 0;
    let low = 0,
      high = lis.length;
    while (low < high) {
      const mid = (low + high) >> 1;
      if (lis[mid] < index) {
        low = mid + 1;
      } else {
        high = mid;
      }
    }
    pos = low;

    if (pos === lis.length) {
      lis.push(index);
    } else {
      lis[pos] = index;
    }
  }

  return target.length - lis.length;
}
