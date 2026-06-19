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

function deleteNode(root: TreeNode | null, key: number): TreeNode | null {
  if (root === null) {
    return null;
  }
  if (root.val === key) {
    return helper(root);
  }

  let dummy = root;
  while (root !== null) {
    if (root.val > key) {
      if (root.left !== null && root.left.val === key) {
        root.left = helper(root.left);
        break;
      } else {
        root = root.left;
      }
    } else {
      if (root.right !== null && root.right.val === key) {
        root.right = helper(root.right);
        break;
      } else {
        root = root.right;
      }
    }
  }
  return dummy;
}

function helper(root: TreeNode | null): TreeNode | null {
  if (root === null) return null;
  if (root.left === null) {
    return root.right;
  }
  if (root.right === null) {
    return root.left;
  }

  const rightChild = root.right;
  const lastRight = flr(root.left);
  lastRight!.right = rightChild;
  return root.left;
}

function flr(root: TreeNode | null): TreeNode | null {
  if (root!.right === null) {
    return root;
  }
  return flr(root!.right);
}
