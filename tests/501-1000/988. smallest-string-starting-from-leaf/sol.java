/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
import java.util.LinkedList;
import java.util.Queue;

class Solution {
    public String smallestFromLeaf(TreeNode root) {
        String smallestString = "";
        Queue<Object[]> nodeQueue = new LinkedList<>();
        
        nodeQueue.add(new Object[]{root, String.valueOf((char)(root.val + 'a'))});
        
        while (!nodeQueue.isEmpty()) {
            Object[] curr = nodeQueue.poll();
            TreeNode node = (TreeNode) curr[0];
            String currentString = (String) curr[1];
            
            if (node.left == null && node.right == null) {
                if (smallestString.isEmpty() || currentString.compareTo(smallestString) < 0) {
                    smallestString = currentString;
                }
            }
            
            if (node.left != null) {
                nodeQueue.add(new Object[]{node.left, (char)(node.left.val + 'a') + currentString});
            }
            
            if (node.right != null) {
                nodeQueue.add(new Object[]{node.right, (char)(node.right.val + 'a') + currentString});
            }
        }
        
        return smallestString;
    }
}
