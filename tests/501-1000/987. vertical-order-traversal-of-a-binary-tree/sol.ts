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

function verticalTraversal(root: TreeNode | null): number[][] {
  const nodes: [number, number, number][] = [];

  const dfs = (node: TreeNode | null, row: number, col: number): void => {
    if (!node) return;
    nodes.push([col, row, node.val]);
    dfs(node.left, row + 1, col - 1);
    dfs(node.right, row + 1, col + 1);
  };

  dfs(root, 0, 0);

  nodes.sort((a, b) => {
    if (a[0] !== b[0]) return a[0] - b[0];
    if (a[1] !== b[1]) return a[1] - b[1];
    return a[2] - b[2];
  });

  const res: number[][] = [];
  let prevCol: number | null = null;

  for (const [col, , val] of nodes) {
    if (col !== prevCol) {
      res.push([]);
      prevCol = col;
    }
    res[res.length - 1].push(val);
  }

  return res;
}
