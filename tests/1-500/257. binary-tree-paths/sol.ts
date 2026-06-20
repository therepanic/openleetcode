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

function binaryTreePaths(root: TreeNode | null): string[] {
  const res: string[] = [];
  if (!root) {
    return res;
  }
  const stack: [TreeNode, string][] = [[root, root.val.toString()]];
  while (stack.length > 0) {
    const [node, path] = stack.pop()!;
    if (!node.left && !node.right) {
      res.push(path);
    }
    if (node.right) {
      stack.push([node.right, path + "->" + node.right.val]);
    }
    if (node.left) {
      stack.push([node.left, path + "->" + node.left.val]);
    }
  }
  return res;
}
