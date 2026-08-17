function minimumDeviation(nums: number[]): number {
  if (nums.length === 0) return Infinity;

  const maxHeap: number[] = [];
  const push = (value: number) => {
    maxHeap.push(value);
    let i = maxHeap.length - 1;
    while (i > 0) {
      const p = Math.floor((i - 1) / 2);
      if (maxHeap[p] >= maxHeap[i]) break;
      [maxHeap[p], maxHeap[i]] = [maxHeap[i], maxHeap[p]];
      i = p;
    }
  };
  let minVal = Infinity;

  for (const num of nums) {
    if (num % 2 === 0) {
      push(num);
      minVal = Math.min(num, minVal);
    } else {
      push(num * 2);
      minVal = Math.min(num * 2, minVal);
    }
  }

  let res = Infinity;
  while (maxHeap[0] % 2 === 0) {
    const maxVal = maxHeap[0];
    maxHeap[0] = maxHeap[maxHeap.length - 1];
    maxHeap.pop();
    let i = 0;
    while (true) {
      const l = i * 2 + 1;
      if (l >= maxHeap.length) break;
      const r = l + 1;
      let j = l;
      if (r < maxHeap.length && maxHeap[r] > maxHeap[l]) j = r;
      if (maxHeap[i] >= maxHeap[j]) break;
      [maxHeap[i], maxHeap[j]] = [maxHeap[j], maxHeap[i]];
      i = j;
    }
    res = Math.min(res, maxVal - minVal);
    const newNum = maxVal / 2;
    push(newNum);
    minVal = Math.min(newNum, minVal);
  }

  res = Math.min(maxHeap[0] - minVal, res);
  return res;
}
