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

function isCousins(root: TreeNode | null, x: number, y: number): boolean {
  const res: [TreeNode | null, number][] = [];
  const stack: [TreeNode, TreeNode | null, number][] = [[root!, null, 0]];
  while (stack.length > 0) {
    const [curr, parent, depth] = stack.pop()!;
    if (curr.val === x || curr.val === y) {
      res.push([parent, depth]);
    }
    if (curr.left) {
      stack.push([curr.left, curr, depth + 1]);
    }
    if (curr.right) {
      stack.push([curr.right, curr, depth + 1]);
    }
  }
  return res.length === 2 && res[0][1] === res[1][1] && res[0][0] !== res[1][0];
}
