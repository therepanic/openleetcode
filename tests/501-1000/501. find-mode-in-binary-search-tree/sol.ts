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

function findMode(root: TreeNode | null): number[] {
  const lst: number[] = [];
  const traverse = (curr: TreeNode | null) => {
    if (curr) {
      lst.push(curr.val);
      traverse(curr.left);
      traverse(curr.right);
    }
  };
  traverse(root);
  const d: Map<number, number> = new Map();
  for (const v of lst) {
    d.set(v, (d.get(v) || 0) + 1);
  }
  let m = 0;
  for (const v of lst) {
    m = Math.max(m, d.get(v)!);
  }
  const sol: Set<number> = new Set();
  for (const v of lst) {
    if (d.get(v) === m) {
      sol.add(v);
    }
  }
  return Array.from(sol);
}
