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

function subtreeWithAllDeepest(root: TreeNode | null): TreeNode | null {
  if (!root) return null;

  const parent = new Map<TreeNode, TreeNode | null>();
  parent.set(root, null);
  const q: TreeNode[] = [root];
  let lastLevel: TreeNode[] = [];

  while (q.length > 0) {
    const size = q.length;
    lastLevel = [];
    for (let i = 0; i < size; i++) {
      const node = q.shift()!;
      lastLevel.push(node);
      if (node.left) {
        parent.set(node.left, node);
        q.push(node.left);
      }
      if (node.right) {
        parent.set(node.right, node);
        q.push(node.right);
      }
    }
  }

  let deepest = new Set(lastLevel);
  while (deepest.size > 1) {
    const next = new Set<TreeNode>();
    for (const node of deepest) {
      next.add(parent.get(node)!);
    }
    deepest = next;
  }

  return deepest.values().next().value!;
}
