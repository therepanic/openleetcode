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

function isCompleteTree(root: TreeNode | null): boolean {
  const q: (TreeNode | null)[] = [root];
  let past = false;
  while (q.length > 0) {
    const node = q.shift()!;
    if (node === null) {
      past = true;
    } else {
      if (past) return false;
      q.push(node.left);
      q.push(node.right);
    }
  }
  return true;
}
