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

function pruneTree(root: TreeNode | null): TreeNode | null {
  function traverseAndRemove(temp: TreeNode | null): boolean {
    if (temp === null) {
      return false;
    }
    if (temp.left === null && temp.right === null) {
      return temp.val === 1;
    }
    const left = traverseAndRemove(temp.left);
    const right = traverseAndRemove(temp.right);
    if (!left) {
      temp.left = null;
    }
    if (!right) {
      temp.right = null;
    }
    return left || right || temp.val === 1;
  }

  traverseAndRemove(root);
  if (
    root !== null &&
    root.left === null &&
    root.right === null &&
    root.val === 0
  ) {
    return null;
  }
  return root;
}
