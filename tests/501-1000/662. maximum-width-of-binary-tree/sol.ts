/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */

function widthOfBinaryTree(root: TreeNode | null): number {
  const q: (TreeNode | null)[] = [root];
  const ind: number[] = [0];
  const res: number[][] = [];
  while (q.length > 0) {
    const l: number[] = [];
    const size = q.length;
    for (let k = 0; k < size; k++) {
      const node = q.shift()!;
      const i = ind.shift()!;
      if (node) {
        l.push(i);
        if (node.left) {
          q.push(node.left);
          ind.push(2 * i + 1);
        }
        if (node.right) {
          q.push(node.right);
          ind.push(2 * i + 2);
        }
      }
    }
    res.push(l);
  }
  let maxWidth = 0;
  for (const r of res) {
    if (r.length >= 1) {
      const width = r[r.length - 1] - r[0] + 1;
      maxWidth = Math.max(maxWidth, width);
    }
  }
  return maxWidth;
}
