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

function countNodes(root: TreeNode | null): number {
  if (root === null) {
    return 0;
  }

  const leftDepth = getDepth(root.left);
  const rightDepth = getDepth(root.right);

  if (leftDepth === rightDepth) {
    return (1 << leftDepth) + countNodes(root.right);
  } else {
    return (1 << rightDepth) + countNodes(root.left);
  }
}

function getDepth(node: TreeNode | null): number {
  let depth = 0;
  while (node !== null) {
    depth++;
    node = node.left;
  }
  return depth;
}
