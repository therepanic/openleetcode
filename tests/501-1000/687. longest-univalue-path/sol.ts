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

function longestUnivaluePath(root: TreeNode | null): number {
  let ans = 0;
  function solve(node: TreeNode | null): number {
    if (node === null) return 0;
    const left = solve(node.left);
    const right = solve(node.right);
    let leftPath = 0;
    let rightPath = 0;
    if (node.left !== null && node.left.val === node.val) {
      leftPath = left + 1;
    }
    if (node.right !== null && node.right.val === node.val) {
      rightPath = right + 1;
    }
    ans = Math.max(ans, leftPath + rightPath);
    return Math.max(leftPath, rightPath);
  }
  solve(root);
  return ans;
}
