function delNodes(
  root: TreeNode | null,
  to_delete: number[],
): Array<TreeNode | null> {
  const ans: TreeNode[] = [];
  if (!root) return ans;

  const st = new Set(to_delete);

  const ref = new TreeNode(-1);
  ref.left = root;

  const q1: TreeNode[] = [];
  const toProcess: TreeNode[] = [ref];

  while (toProcess.length > 0) {
    const newTree = toProcess.shift()!;

    if (newTree.left) {
      if (st.has(newTree.left.val)) {
        toProcess.push(newTree.left);
      } else {
        ans.push(newTree.left);
        q1.push(newTree.left);
      }
      newTree.left = null;
    }

    if (newTree.right) {
      if (st.has(newTree.right.val)) {
        toProcess.push(newTree.right);
      } else {
        ans.push(newTree.right);
        q1.push(newTree.right);
      }
      newTree.right = null;
    }

    while (q1.length > 0) {
      const temp = q1.shift()!;

      if (temp.left) {
        if (st.has(temp.left.val)) {
          toProcess.push(temp.left);
          temp.left = null;
        } else {
          q1.push(temp.left);
        }
      }

      if (temp.right) {
        if (st.has(temp.right.val)) {
          toProcess.push(temp.right);
          temp.right = null;
        } else {
          q1.push(temp.right);
        }
      }
    }
  }

  return ans;
}
