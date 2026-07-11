/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
import 'dart:collection';

class Solution {
  String smallestFromLeaf(TreeNode? root) {
    String smallestString = "";
    Queue<List<Object>> nodeQueue = Queue();
    
    nodeQueue.add([root!, String.fromCharCode(root.val + 97)]);
    
    while (nodeQueue.isNotEmpty) {
      List<Object> curr = nodeQueue.removeFirst();
      TreeNode node = curr[0] as TreeNode;
      String currentString = curr[1] as String;
      
      if (node.left == null && node.right == null) {
        if (smallestString.isEmpty || currentString.compareTo(smallestString) < 0) {
          smallestString = currentString;
        }
      }
      
      if (node.left != null) {
        nodeQueue.add([node.left!, String.fromCharCode(node.left!.val + 97) + currentString]);
      }
      
      if (node.right != null) {
        nodeQueue.add([node.right!, String.fromCharCode(node.right!.val + 97) + currentString]);
      }
    }
    
    return smallestString;
  }
}
