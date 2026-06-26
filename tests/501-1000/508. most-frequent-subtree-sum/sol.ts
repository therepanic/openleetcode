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

function findFrequentTreeSum(root: TreeNode | null): number[] {
  const c: Map<number, number> = new Map();
  let maxCnt = 0;
  const s = (n: TreeNode | null): number => {
    if (!n) return 0;
    const r = n.val + s(n.left) + s(n.right);
    c.set(r, (c.get(r) || 0) + 1);
    if (c.get(r)! > maxCnt) maxCnt = c.get(r)!;
    return r;
  };
  s(root);
  const res: number[] = [];
  c.forEach((v, k) => {
    if (v === maxCnt) res.push(k);
  });
  return res;
}
