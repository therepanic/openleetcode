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

function sumEvenGrandparent(root: TreeNode | null): number {
  const queue: [TreeNode | null, number, number][] = [[root, -1, -1]];
  let res = 0;
  while (queue.length > 0) {
    const [node, parent, grandparent] = queue.shift()!;
    if (node === null) continue;
    if (grandparent % 2 === 0) {
      res += node.val;
    }
    if (node.left !== null) {
      queue.push([node.left, node.val, parent]);
    }
    if (node.right !== null) {
      queue.push([node.right, node.val, parent]);
    }
  }
  return res;
}
