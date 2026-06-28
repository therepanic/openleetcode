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

function printTree(root: TreeNode | null): string[][] {
  const findHeight = (node: TreeNode | null): number => {
    if (node === null) return 0;
    let height = 0;
    if (node.left !== null) {
      height = Math.max(height, 1 + findHeight(node.left));
    }
    if (node.right !== null) {
      height = Math.max(height, 1 + findHeight(node.right));
    }
    return height;
  };

  const height = findHeight(root);
  const m = height + 1;
  const n = (1 << (height + 1)) - 1;
  const matrix: string[][] = Array.from({ length: m }, () => Array(n).fill(""));
  const queue: Array<[TreeNode, number, number]> = [[root!, 0, (n - 1) >> 1]];
  while (queue.length > 0) {
    const levelSize = queue.length;
    for (let i = 0; i < levelSize; i++) {
      const [frontNode, x, y] = queue.shift()!;
      matrix[x][y] = frontNode.val.toString();
      if (frontNode.left !== null) {
        queue.push([frontNode.left, x + 1, y - (1 << (height - x - 1))]);
      }
      if (frontNode.right !== null) {
        queue.push([frontNode.right, x + 1, y + (1 << (height - x - 1))]);
      }
    }
  }
  return matrix;
}
