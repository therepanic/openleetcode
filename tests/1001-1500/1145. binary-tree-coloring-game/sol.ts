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

function btreeGameWinningMove(
  root: TreeNode | null,
  n: number,
  x: number,
): boolean {
  const subtreeCount = (node: TreeNode | null): number => {
    if (node === null) return 0;
    const leftCount = subtreeCount(node.left);
    const rightCount = subtreeCount(node.right);
    return leftCount + rightCount + 1;
  };

  const queue: (TreeNode | null)[] = [root];
  let node: TreeNode | null = null;
  while (queue.length > 0) {
    const front = queue.shift()!;
    if (front.val === x) {
      node = front;
      break;
    }
    if (front.left !== null) queue.push(front.left);
    if (front.right !== null) queue.push(front.right);
  }

  const leftCount = subtreeCount(node!.left);
  const rightCount = subtreeCount(node!.right);
  const parentCount = n - leftCount - rightCount - 1;
  if (parentCount > leftCount + rightCount) return true;
  else if (leftCount > parentCount + rightCount) return true;
  else if (rightCount > parentCount + leftCount) return true;
  return false;
}
