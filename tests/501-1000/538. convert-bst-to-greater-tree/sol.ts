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

function convertBST(root: TreeNode | null): TreeNode | null {
  let total = 0;

  function traverse(node: TreeNode | null): void {
    if (node === null) {
      return;
    }
    traverse(node.right);
    total += node.val;
    node.val = total;
    traverse(node.left);
  }

  traverse(root);
  return root;
}
