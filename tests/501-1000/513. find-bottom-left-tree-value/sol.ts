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

function findBottomLeftValue(root: TreeNode | null): number {
  const queue: TreeNode[] = [root!];
  let leftmost: number = root!.val;

  while (queue.length > 0) {
    const levelSize = queue.length;
    leftmost = queue[0].val;

    for (let i = 0; i < levelSize; i++) {
      const node = queue.shift()!;
      if (node.left) {
        queue.push(node.left);
      }
      if (node.right) {
        queue.push(node.right);
      }
    }
  }

  return leftmost;
}
