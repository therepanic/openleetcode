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

function minDiffInBST(root: TreeNode | null): number {
  let prev: number | null = null;
  let minDiff = Infinity;

  function inorder(node: TreeNode | null): void {
    if (!node) return;
    inorder(node.left);
    if (prev !== null) {
      const diff = node.val - prev;
      if (diff < minDiff) {
        minDiff = diff;
      }
    }
    prev = node.val;
    inorder(node.right);
  }

  inorder(root);
  return minDiff;
}
