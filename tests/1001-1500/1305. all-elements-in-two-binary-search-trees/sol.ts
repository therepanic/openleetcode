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

function getAllElements(
  root1: TreeNode | null,
  root2: TreeNode | null,
): number[] {
  const stack1: TreeNode[] = [];
  const stack2: TreeNode[] = [];
  const output: number[] = [];

  while (
    root1 !== null ||
    root2 !== null ||
    stack1.length > 0 ||
    stack2.length > 0
  ) {
    while (root1 !== null) {
      stack1.push(root1);
      root1 = root1.left;
    }
    while (root2 !== null) {
      stack2.push(root2);
      root2 = root2.left;
    }

    if (stack1.length > 0 && stack2.length > 0) {
      if (stack1[stack1.length - 1].val <= stack2[stack2.length - 1].val) {
        root1 = stack1.pop()!;
        output.push(root1.val);
        root1 = root1.right;
      } else {
        root2 = stack2.pop()!;
        output.push(root2.val);
        root2 = root2.right;
      }
    } else if (stack1.length === 0) {
      root2 = stack2.pop()!;
      output.push(root2.val);
      root2 = root2.right;
    } else {
      root1 = stack1.pop()!;
      output.push(root1.val);
      root1 = root1.right;
    }
  }

  return output;
}
