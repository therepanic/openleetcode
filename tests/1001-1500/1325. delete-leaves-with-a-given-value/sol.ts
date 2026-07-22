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

function removeLeafNodes(
  root: TreeNode | null,
  target: number,
): TreeNode | null {
  const traverseAndRemove = (temp: TreeNode | null): boolean => {
    if (temp === null) {
      return false;
    }
    if (temp.left === null && temp.right === null) {
      return temp.val !== target;
    }
    const left = traverseAndRemove(temp.left);
    const right = traverseAndRemove(temp.right);
    if (!left) {
      temp.left = null;
    }
    if (!right) {
      temp.right = null;
    }
    return left || right || temp.val !== target;
  };

  if (!traverseAndRemove(root)) {
    return null;
  }
  return root;
}
