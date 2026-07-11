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

function bstFromPreorder(preorder: number[]): TreeNode | null {
  if (preorder.length === 0) {
    return null;
  }
  return build(preorder, 0, preorder.length - 1);
}

function build(
  preorder: number[],
  start: number,
  end: number,
): TreeNode | null {
  if (start > end) {
    return null;
  }
  const root = new TreeNode(preorder[start]);
  let i = start + 1;
  while (i <= end && preorder[i] < root.val) {
    i++;
  }
  root.left = build(preorder, start + 1, i - 1);
  root.right = build(preorder, i, end);
  return root;
}
