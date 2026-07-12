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

function sufficientSubset(
  root: TreeNode | null,
  limit: number,
): TreeNode | null {
  const dfs = (node: TreeNode | null, pathSum: number): boolean => {
    if (node === null) {
      return false;
    }

    const curr = pathSum + node.val;

    if (node.left === null && node.right === null) {
      return curr >= limit;
    }

    const leftGood = dfs(node.left, curr);
    const rightGood = dfs(node.right, curr);

    if (!leftGood) {
      node.left = null;
    }
    if (!rightGood) {
      node.right = null;
    }

    return leftGood || rightGood;
  };

  return dfs(root, 0) ? root : null;
}
