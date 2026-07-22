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

function maxSumBST(root: TreeNode | null): number {
  let best = 0;

  function dfs(node: TreeNode | null): [boolean, number, number, number] {
    if (!node) {
      return [true, Infinity, -Infinity, 0];
    }

    const [lbst, lmin, lmax, lsum] = dfs(node.left);
    const [rbst, rmin, rmax, rsum] = dfs(node.right);

    if (lbst && rbst && lmax < node.val && node.val < rmin) {
      const total = lsum + rsum + node.val;
      best = Math.max(best, total);
      const newMin = Math.min(lmin, node.val);
      const newMax = Math.max(rmax, node.val);
      return [true, newMin, newMax, total];
    }

    return [false, -Infinity, Infinity, 0];
  }

  dfs(root);
  return best;
}
