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

function countPairs(root: TreeNode | null, distance: number): number {
  const graph = new Map<TreeNode, TreeNode[]>();

  function dfs(node: TreeNode | null, parent: TreeNode | null) {
    if (!node) return;
    if (parent) {
      if (!graph.has(parent)) graph.set(parent, []);
      if (!graph.has(node)) graph.set(node, []);
      graph.get(parent)!.push(node);
      graph.get(node)!.push(parent);
    }
    dfs(node.left, node);
    dfs(node.right, node);
  }
  dfs(root, null);

  const leaves: TreeNode[] = [];
  for (const node of graph.keys()) {
    if (!node.left && !node.right) leaves.push(node);
  }

  let ans = 0;
  for (let i = 0; i < leaves.length; i++) {
    const leaf = leaves[i];
    const q: Array<[TreeNode, number]> = [[leaf, 0]];
    const visited = new Set<TreeNode>([leaf]);

    while (q.length > 0) {
      const [node, dist] = q.shift()!;
      if (dist >= distance) continue;
      const neighbors = graph.get(node) || [];
      for (const nei of neighbors) {
        if (!visited.has(nei)) {
          visited.add(nei);
          q.push([nei, dist + 1]);
          if (!nei.left && !nei.right && leaves.indexOf(nei) > i) {
            ans++;
          }
        }
      }
    }
  }
  return ans;
}
