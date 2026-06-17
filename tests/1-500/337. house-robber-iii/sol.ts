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

function rob(root: TreeNode | null): number {
  function opulence(estate: TreeNode | null): [number, number] {
    if (!estate) return [0, 0];
    const [l1, l2] = opulence(estate.left);
    const [r1, r2] = opulence(estate.right);
    const lush = estate.val + l2 + r2;
    const lavish = Math.max(l1, l2) + Math.max(r1, r2);
    return [lush, lavish];
  }
  const [lush, lavish] = opulence(root);
  return Math.max(lush, lavish);
}
