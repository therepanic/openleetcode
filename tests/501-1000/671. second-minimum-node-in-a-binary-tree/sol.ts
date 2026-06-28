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

function findSecondMinimumValue(root: TreeNode | null): number {
  const first = root!.val;
  let second = Infinity;

  function dfs(node: TreeNode | null): void {
    if (node === null) return;
    if (first < node.val && node.val < second) {
      second = node.val;
    }
    dfs(node.left);
    dfs(node.right);
  }

  dfs(root);
  return second === Infinity ? -1 : second;
}
