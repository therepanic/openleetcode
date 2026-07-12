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

function sumRootToLeaf(root: TreeNode | null): number {
  const dfs = (node: TreeNode | null, current: number): number => {
    if (node === null) {
      return 0;
    }

    current = current * 2 + node.val;

    if (node.left === null && node.right === null) {
      return current;
    }

    return dfs(node.left, current) + dfs(node.right, current);
  };

  return dfs(root, 0);
}
