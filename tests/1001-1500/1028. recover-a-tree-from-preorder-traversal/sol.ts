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

function recoverFromPreorder(traversal: string): TreeNode | null {
  const stack: TreeNode[] = [];
  let root: TreeNode | null = null;
  let i = 0;
  while (i < traversal.length) {
    let depth = 0;
    while (i < traversal.length && traversal[i] === "-") {
      depth++;
      i++;
    }
    let num = 0;
    while (i < traversal.length) {
      const code = traversal.charCodeAt(i);
      if (code < 48 || code > 57) break;
      num = num * 10 + (code - 48);
      i++;
    }
    const node = new TreeNode(num);
    while (stack.length > depth) {
      stack.pop();
    }
    if (stack.length === 0) {
      root = node;
    } else {
      const parent = stack[stack.length - 1];
      if (parent.left === null) {
        parent.left = node;
      } else {
        parent.right = node;
      }
    }
    stack.push(node);
  }
  return root;
}
