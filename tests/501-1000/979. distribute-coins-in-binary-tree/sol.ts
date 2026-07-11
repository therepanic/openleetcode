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

function distributeCoins(root: TreeNode | null): number {
  let moves: number = 0;

  function solve(node: TreeNode | null): number {
    if (!node) return 0;
    const leftCandie = solve(node.left);
    const rightCandie = solve(node.right);
    moves += Math.abs(leftCandie) + Math.abs(rightCandie);
    return leftCandie + rightCandie + node.val - 1;
  }

  solve(root);
  return moves;
}
