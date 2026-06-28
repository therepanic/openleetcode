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

function findDuplicateSubtrees(root: TreeNode | null): Array<TreeNode | null> {
  const seen: Map<string, number> = new Map();
  const ans: Array<TreeNode | null> = [];

  function solve(node: TreeNode | null): string {
    if (node === null) {
      return "#";
    }
    const left = solve(node.left);
    const right = solve(node.right);
    const currTree = `${node.val}, ${left}, ${right}`;
    seen.set(currTree, (seen.get(currTree) || 0) + 1);
    if (seen.get(currTree) === 2) {
      ans.push(node);
    }
    return currTree;
  }

  solve(root);
  return ans;
}
