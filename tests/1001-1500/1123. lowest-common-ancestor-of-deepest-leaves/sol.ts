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

function lcaDeepestLeaves(root: TreeNode | null): TreeNode | null {
  function dfs(
    node: TreeNode | null,
    depth: number,
  ): [TreeNode | null, number] {
    if (node === null) {
      return [null, depth];
    }

    const left = dfs(node.left, depth + 1);
    const right = dfs(node.right, depth + 1);

    if (left[1] > right[1]) {
      return [left[0], left[1]];
    } else if (right[1] > left[1]) {
      return [right[0], right[1]];
    } else {
      return [node, left[1]];
    }
  }

  return dfs(root, 0)[0];
}
