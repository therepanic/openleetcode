/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func matches(_ node: TreeNode?, _ current: ListNode?) -> Bool {
        if current == nil { return true }
        if node == nil || node!.val != current!.val { return false }
        return matches(node!.left, current!.next) || matches(node!.right, current!.next)
    }

    func isSubPath(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        if root == nil { return false }
        return matches(root, head) || isSubPath(head, root!.left) || isSubPath(head, root!.right)
    }
}
