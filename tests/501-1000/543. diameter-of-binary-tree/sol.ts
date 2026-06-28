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

function diameterOfBinaryTree(root: TreeNode | null): number {
  function height(node: TreeNode | null): number {
    if (node === null) return 0;
    return 1 + Math.max(height(node.left), height(node.right));
  }

  function diameter(node: TreeNode | null): number {
    if (node === null) return 0;
    const diameterThroughNode = height(node.left) + height(node.right);
    const leftDiameter = diameter(node.left);
    const rightDiameter = diameter(node.right);
    return Math.max(diameterThroughNode, Math.max(leftDiameter, rightDiameter));
  }

  return diameter(root);
}
