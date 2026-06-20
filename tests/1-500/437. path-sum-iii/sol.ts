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

function pathSum(root: TreeNode | null, targetSum: number): number {
  const prefixSums: Map<number, number> = new Map();
  prefixSums.set(0, 1);

  function dfs(node: TreeNode | null, currentSum: number): number {
    if (node === null) return 0;
    currentSum += node.val;
    let count = prefixSums.get(currentSum - targetSum) || 0;
    prefixSums.set(currentSum, (prefixSums.get(currentSum) || 0) + 1);
    count += dfs(node.left, currentSum);
    count += dfs(node.right, currentSum);
    prefixSums.set(currentSum, prefixSums.get(currentSum)! - 1);
    return count;
  }

  return dfs(root, 0);
}
