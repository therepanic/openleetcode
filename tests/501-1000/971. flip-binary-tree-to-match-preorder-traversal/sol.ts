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

function flipMatchVoyage(root: TreeNode | null, voyage: number[]): number[] {
  const flippedNodes: number[] = [];
  let idx = 0;

  function dfs(node: TreeNode | null): boolean {
    if (node === null) return true;
    if (node.val !== voyage[idx]) return false;

    idx++;
    if (node.left !== null && node.right !== null) {
      if (voyage[idx] === node.right.val) {
        flippedNodes.push(node.val);
        if (!dfs(node.right)) return false;
        if (!dfs(node.left)) return false;
      } else if (voyage[idx] === node.left.val) {
        if (!dfs(node.left)) return false;
        if (!dfs(node.right)) return false;
      } else {
        return false;
      }
    } else {
      if (node.left !== null) {
        if (!dfs(node.left)) return false;
      } else if (node.right !== null) {
        if (!dfs(node.right)) return false;
      }
    }
    return true;
  }

  if (!dfs(root)) return [-1];
  return flippedNodes;
}
