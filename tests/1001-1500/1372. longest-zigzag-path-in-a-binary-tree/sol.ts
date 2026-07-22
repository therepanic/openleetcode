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

function longestZigZag(root: TreeNode | null): number {
  if (root === null) return 0;
  let best = 0;
  const stack: [TreeNode, number, number][] = [[root, 0, 0]];
  while (stack.length > 0) {
    const [node, endedLeft, endedRight] = stack.pop()!;
    best = Math.max(best, endedLeft, endedRight);
    if (node.left !== null) {
      stack.push([node.left, endedRight + 1, 0]);
    }
    if (node.right !== null) {
      stack.push([node.right, 0, endedLeft + 1]);
    }
  }
  return best;
}
