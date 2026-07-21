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

function maxLevelSum(root: TreeNode | null): number {
  let idx = 0;
  let maxSum = -Infinity;
  const q: TreeNode[] = [root!];
  let level = 1;
  while (q.length > 0) {
    const qz = q.length;
    let curSum = 0;
    for (let i = 0; i < qz; i++) {
      const node = q.shift()!;
      curSum += node.val;
      if (node.left) q.push(node.left);
      if (node.right) q.push(node.right);
    }
    if (curSum > maxSum) {
      idx = level;
      maxSum = curSum;
    }
    level++;
  }
  return idx;
}
