function maxNumber(nums1: number[], nums2: number[], k: number): number[] {
  let ans: number[] = [];
  const m = nums1.length,
    n = nums2.length;
  const start = Math.max(0, k - n);
  const end = Math.min(m, k);
  for (let i = start; i <= end; i++) {
    const sub1 = getMaxSubsequence(nums1, i);
    const sub2 = getMaxSubsequence(nums2, k - i);
    const merged = merge(sub1, sub2);
    if (greater(merged, 0, ans, 0)) {
      ans = merged;
    }
  }
  return ans;
}

function getMaxSubsequence(nums: number[], q: number): number[] {
  const stack: number[] = [];
  let maxDrop = nums.length - q;
  for (const num of nums) {
    while (maxDrop > 0 && stack.length > 0 && stack[stack.length - 1] < num) {
      stack.pop();
      maxDrop--;
    }
    if (stack.length < q) {
      stack.push(num);
    } else {
      maxDrop--;
    }
  }
  return stack;
}

function merge(a: number[], b: number[]): number[] {
  const output: number[] = [];
  let i = 0,
    j = 0;
  while (i < a.length || j < b.length) {
    if (greater(a, i, b, j)) {
      output.push(a[i++]);
    } else {
      output.push(b[j++]);
    }
  }
  return output;
}

function greater(a: number[], i: number, b: number[], j: number): boolean {
  while (i < a.length && j < b.length && a[i] === b[j]) {
    i++;
    j++;
  }
  if (j === b.length) return true;
  if (i < a.length && a[i] > b[j]) return true;
  return false;
}
