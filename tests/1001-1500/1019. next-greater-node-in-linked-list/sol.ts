function nextLargerNodes(head: ListNode | null): number[] {
  const arr: number[] = [];
  while (head !== null) {
    arr.push(head.val);
    head = head.next;
  }
  const n = arr.length;
  const ans: number[] = new Array(n).fill(0);
  const stack: number[] = [];
  for (let i = 0; i < n; i++) {
    while (stack.length && arr[i] > arr[stack[stack.length - 1]]) {
      ans[stack.pop()!] = arr[i];
    }
    stack.push(i);
  }
  return ans;
}
