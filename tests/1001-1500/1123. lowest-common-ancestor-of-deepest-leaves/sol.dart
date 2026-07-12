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
  TreeNode? lcaDeepestLeaves(TreeNode? root) {
    var result = _dfs(root, 0);
    return result.node;
  }
  
  _Pair _dfs(TreeNode? node, int depth) {
    if (node == null) {
      return _Pair(null, depth);
    }
    
    var left = _dfs(node.left, depth + 1);
    var right = _dfs(node.right, depth + 1);
    
    if (left.depth > right.depth) {
      return _Pair(left.node, left.depth);
    } else if (right.depth > left.depth) {
      return _Pair(right.node, right.depth);
    } else {
      return _Pair(node, left.depth);
    }
  }
}

class _Pair {
  TreeNode? node;
  int depth;
  _Pair(this.node, this.depth);
}
