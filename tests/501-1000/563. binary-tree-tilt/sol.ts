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

function findTilt(root: TreeNode | null): number {
  let ans = 0;
  function helper(n: TreeNode | null): number {
    if (!n) return 0;
    const l = helper(n.left);
    const r = helper(n.right);
    ans += Math.abs(l - r);
    return l + r + n.val;
  }
  helper(root);
  return ans;
}
