function createSortedArray(instructions: number[]): number {
  const n = instructions.length;
  const nums = instructions;
  const ans: number[][] = Array.from({ length: n }, () => [0, 0]);

  const merge = (left: number[], right: number[]): number[] => {
    let l = left.length - 1;
    let r = right.length - 1;
    while (l > -1 && r > -1) {
      if (nums[left[l]] <= nums[right[r]]) {
        ans[right[r]][1] += left.length - 1 - l;
        r--;
      } else {
        l--;
      }
    }
    while (r > -1) {
      ans[right[r]][1] += left.length;
      r--;
    }

    l = 0;
    r = 0;
    const res: number[] = [];
    while (l < left.length && r < right.length) {
      if (nums[left[l]] < nums[right[r]]) {
        res.push(left[l]);
        l++;
      } else {
        ans[right[r]][0] += l;
        res.push(right[r]);
        r++;
      }
    }
    while (r < right.length) {
      ans[right[r]][0] += l;
      res.push(right[r]);
      r++;
    }
    while (l < left.length) {
      res.push(left[l]);
      l++;
    }
    return res;
  };

  const split = (l: number, r: number, arr: number[]): number[] => {
    if (l === r) {
      return [arr[r]];
    }
    const mid = Math.floor((l + r) / 2);
    const left = split(l, mid, arr);
    const right = split(mid + 1, r, arr);
    return merge(left, right);
  };

  split(
    0,
    n - 1,
    Array.from({ length: n }, (_, i) => i),
  );

  let realAns = 0;
  for (let i = 0; i < n; i++) {
    realAns += Math.min(ans[i][0], ans[i][1]);
  }
  return realAns % 1000000007;
}
