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

function bstToGst(root: TreeNode | null): TreeNode | null {
  let sum = 0;
  function traversal(node: TreeNode | null): void {
    if (node === null) return;
    if (node.right !== null) {
      traversal(node.right);
    }
    sum += node.val;
    node.val = sum;
    if (node.left !== null) {
      traversal(node.left);
    }
  }
  traversal(root);
  return root;
}
