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

function sumOfLeftLeaves(root: TreeNode | null): number {
  const dfs = (node: TreeNode | null, isLeft: boolean): number => {
    if (node === null) return 0;
    if (node.left === null && node.right === null) {
      return isLeft ? node.val : 0;
    }
    return dfs(node.left, true) + dfs(node.right, false);
  };
  return dfs(root, false);
}
