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

function rangeSumBST(root: TreeNode | null, low: number, high: number): number {
  let res = 0;
  function dfs(node: TreeNode | null): void {
    if (node === null) {
      return;
    }
    dfs(node.left);
    if (low <= node.val && node.val <= high) {
      res += node.val;
    }
    dfs(node.right);
  }
  dfs(root);
  return res;
}
