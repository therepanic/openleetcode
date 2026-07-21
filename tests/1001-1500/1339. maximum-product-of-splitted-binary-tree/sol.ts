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

function maxProduct(root: TreeNode | null): number {
  const MOD = 1_000_000_007;
  const nodes: TreeNode[] = [];
  const stack: (TreeNode | null)[] = [root];

  while (stack.length) {
    const node = stack.pop()!;
    if (node) {
      nodes.push(node);
      stack.push(node.left);
      stack.push(node.right);
    }
  }

  const sums = new Map<TreeNode, number>();
  for (let i = nodes.length - 1; i >= 0; i--) {
    const node = nodes[i];
    const sub =
      node.val + (sums.get(node.left!) ?? 0) + (sums.get(node.right!) ?? 0);
    sums.set(node, sub);
  }

  const total = sums.get(root!)!;
  let best = 0;
  for (const sub of sums.values()) {
    best = Math.max(best, sub * (total - sub));
  }
  return best % MOD;
}
