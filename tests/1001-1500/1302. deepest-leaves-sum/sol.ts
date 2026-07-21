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

function deepestLeavesSum(root: TreeNode | null): number {
  const depthMap: Map<number, number> = new Map();

  function dfs(node: TreeNode | null, depth: number): void {
    if (node === null) return;
    if (node.left === null && node.right === null) {
      depthMap.set(depth, (depthMap.get(depth) || 0) + node.val);
    }
    dfs(node.left, depth + 1);
    dfs(node.right, depth + 1);
  }

  dfs(root, 0);

  let maxDepth = 0;
  for (const depth of depthMap.keys()) {
    if (depth > maxDepth) maxDepth = depth;
  }

  return depthMap.get(maxDepth) || 0;
}
