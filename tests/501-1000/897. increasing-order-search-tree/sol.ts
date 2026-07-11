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

function increasingBST(root: TreeNode | null): TreeNode | null {
  const vals: number[] = [];
  inord(root, vals);
  return create(vals, 0);
}

function create(vals: number[], i: number): TreeNode | null {
  if (i >= vals.length) return null;
  const node = new TreeNode(vals[i]);
  node.right = create(vals, i + 1);
  return node;
}

function inord(root: TreeNode | null, vals: number[]): void {
  if (root === null) return;
  inord(root.left, vals);
  vals.push(root.val);
  inord(root.right, vals);
}
