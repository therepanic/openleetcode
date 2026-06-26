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

function addOneRow(
  root: TreeNode | null,
  val: number,
  depth: number,
): TreeNode | null {
  if (depth === 1) {
    const newRoot = new TreeNode(val);
    newRoot.left = root;
    return newRoot;
  }

  const construct = (temp: TreeNode | null, count: number): void => {
    if (temp === null) {
      return;
    }
    if (count === depth - 1) {
      const newLeft = new TreeNode(val);
      newLeft.left = temp.left;
      temp.left = newLeft;

      const newRight = new TreeNode(val);
      newRight.right = temp.right;
      temp.right = newRight;
      return;
    }
    construct(temp.left, count + 1);
    construct(temp.right, count + 1);
  };

  construct(root, 1);
  return root;
}
