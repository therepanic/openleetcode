/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public int val;
 *     public TreeNode left;
 *     public TreeNode right;
 *     public TreeNode(int val=0, TreeNode left=null, TreeNode right=null) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
using System.Collections.Generic;

public class Solution {
    public string SmallestFromLeaf(TreeNode root) {
        string smallestString = "";
        Queue<(TreeNode, string)> nodeQueue = new Queue<(TreeNode, string)>();
        
        nodeQueue.Enqueue((root, ((char)(root.val + 'a')).ToString()));
        
        while (nodeQueue.Count > 0) {
            var (node, currentString) = nodeQueue.Dequeue();
            
            if (node.left == null && node.right == null) {
                if (smallestString == "" || string.Compare(currentString, smallestString) < 0) {
                    smallestString = currentString;
                }
            }
            
            if (node.left != null) {
                nodeQueue.Enqueue((node.left, (char)(node.left.val + 'a') + currentString));
            }
            
            if (node.right != null) {
                nodeQueue.Enqueue((node.right, (char)(node.right.val + 'a') + currentString));
            }
        }
        
        return smallestString;
    }
}
