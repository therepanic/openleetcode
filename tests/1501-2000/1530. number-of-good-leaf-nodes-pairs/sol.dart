/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
class Solution {
  int countPairs(TreeNode? root, int distance) {
    Map<TreeNode, List<TreeNode>> graph = {};
    
    void dfs(TreeNode? node, TreeNode? parent) {
      if (node == null) return;
      if (parent != null) {
        graph.putIfAbsent(parent, () => []).add(node);
        graph.putIfAbsent(node, () => []).add(parent);
      }
      dfs(node.left, node);
      dfs(node.right, node);
    }
    dfs(root, null);

    List<TreeNode> leaves = graph.keys.where((n) => n.left == null && n.right == null).toList();
    int ans = 0;

    for (int i = 0; i < leaves.length; i++) {
      TreeNode leaf = leaves[i];
      Queue<List<dynamic>> q = Queue();
      Set<TreeNode> visited = {};
      q.add([leaf, 0]);
      visited.add(leaf);

      while (q.isNotEmpty) {
        final curr = q.removeFirst();
        final node = curr[0] as TreeNode;
        final dist = curr[1] as int;
        if (dist >= distance) continue;
        for (final nei in (graph[node] ?? [])) {
          if (!visited.contains(nei)) {
            visited.add(nei);
            q.add([nei, dist + 1]);
            if (nei.left == null && nei.right == null && leaves.indexOf(nei) > i) {
              ans++;
            }
          }
        }
      }
    }
    return ans;
  }
}
