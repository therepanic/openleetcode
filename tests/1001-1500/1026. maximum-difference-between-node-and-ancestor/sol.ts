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

function maxAncestorDiff(root: TreeNode | null): number {
  const m: number[] = [0];
  dfs(root, m);
  return m[0];
}

function dfs(root: TreeNode | null, m: number[]): [number, number] {
  if (root === null) {
    return [Infinity, -Infinity];
  }
  const left = dfs(root.left, m);
  const right = dfs(root.right, m);
  const minVal = Math.min(root.val, Math.min(left[0], right[0]));
  const maxVal = Math.max(root.val, Math.max(left[1], right[1]));
  m[0] = Math.max(
    m[0],
    Math.max(Math.abs(minVal - root.val), Math.abs(maxVal - root.val)),
  );
  return [minVal, maxVal];
}
