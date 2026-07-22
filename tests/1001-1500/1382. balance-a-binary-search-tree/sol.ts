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

function balanceBST(root: TreeNode | null): TreeNode | null {
  const vals: number[] = [];
  inorder(root, vals);
  return build(vals, 0, vals.length - 1);
}

function inorder(node: TreeNode | null, vals: number[]): void {
  const stack: TreeNode[] = [];
  let current = node;
  while (current || stack.length > 0) {
    while (current) {
      stack.push(current);
      current = current.left;
    }
    current = stack.pop()!;
    vals.push(current.val);
    current = current.right;
  }
}

function build(vals: number[], l: number, r: number): TreeNode | null {
  if (l > r) return null;
  const mid = Math.floor((l + r) / 2);
  const node = new TreeNode(vals[mid]);
  node.left = build(vals, l, mid - 1);
  node.right = build(vals, mid + 1, r);
  return node;
}
