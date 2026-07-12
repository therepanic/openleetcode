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

function minCameraCover(root: TreeNode | null): number {
  const dfs = (node: TreeNode | null): number => {
    if (!node) return 0;
    let res = dfs(node.left) + dfs(node.right);
    let curr = Infinity;
    if (node.left) curr = Math.min(curr, node.left.val);
    if (node.right) curr = Math.min(curr, node.right.val);
    if (curr === 0) {
      node.val = 1;
      res += 1;
    } else if (curr === 1) {
      node.val = 2;
    }
    return res;
  };
  return dfs(root) + (root!.val === 0 ? 1 : 0);
}
