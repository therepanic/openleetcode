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

function kthSmallest(root: TreeNode | null, k: number): number {
  const inorderTraversal = (node: TreeNode | null): number[] => {
    if (!node) return [];
    return [
      ...inorderTraversal(node.left),
      node.val,
      ...inorderTraversal(node.right),
    ];
  };

  const sortedElements = inorderTraversal(root);
  return sortedElements[k - 1];
}
