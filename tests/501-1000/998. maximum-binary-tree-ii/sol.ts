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

function insertIntoMaxTree(
  root: TreeNode | null,
  val: number,
): TreeNode | null {
  const dfs = (node: TreeNode | null): TreeNode | null => {
    if (node === null) {
      return new TreeNode(val);
    }
    if (node.val > val) {
      node.right = dfs(node.right);
      return node;
    }
    const temp = new TreeNode(val);
    temp.left = node;
    return temp;
  };
  return dfs(root);
}
