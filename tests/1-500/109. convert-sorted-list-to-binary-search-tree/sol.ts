function sortedListToBST(head: ListNode | null): TreeNode | null {
  const values: number[] = [];
  while (head !== null) {
    values.push(head.val);
    head = head.next;
  }
  const build = (left: number, right: number): TreeNode | null => {
    if (left > right) return null;
    const mid = left + Math.floor((right - left) / 2);
    const root = new TreeNode(values[mid]);
    root.left = build(left, mid - 1);
    root.right = build(mid + 1, right);
    return root;
  };
  return build(0, values.length - 1);
}
