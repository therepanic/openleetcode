function nextGreaterElement(nums1: number[], nums2: number[]): number[] {
  const nextGreater: Map<number, number> = new Map();
  const stack: number[] = [];

  for (let i = nums2.length - 1; i >= 0; i--) {
    const num = nums2[i];
    while (stack.length > 0 && stack[stack.length - 1] <= num) {
      stack.pop();
    }
    nextGreater.set(num, stack.length === 0 ? -1 : stack[stack.length - 1]);
    stack.push(num);
  }

  return nums1.map((num) => nextGreater.get(num)!);
}
