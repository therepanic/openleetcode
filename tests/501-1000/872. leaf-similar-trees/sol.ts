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

function leafSimilar(root1: TreeNode | null, root2: TreeNode | null): boolean {
  const helper = (root: TreeNode | null): number[] => {
    const leaves: number[] = [];
    if (root === null) return leaves;
    const stack: TreeNode[] = [root];
    while (stack.length) {
      const curr = stack.pop()!;
      if (curr.left === null && curr.right === null) {
        leaves.push(curr.val);
      }
      if (curr.right) {
        stack.push(curr.right);
      }
      if (curr.left) {
        stack.push(curr.left);
      }
    }
    return leaves;
  };
  const leaves1 = helper(root1);
  const leaves2 = helper(root2);
  if (leaves1.length !== leaves2.length) return false;
  for (let i = 0; i < leaves1.length; i++) {
    if (leaves1[i] !== leaves2[i]) return false;
  }
  return true;
}
