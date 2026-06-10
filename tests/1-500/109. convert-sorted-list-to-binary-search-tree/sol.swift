
class Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        var values = [Int]()
        var current = head
        while let node = current {
            values.append(node.val)
            current = node.next
        }

        func build(_ left: Int, _ right: Int) -> TreeNode? {
            if left > right { return nil }
            let mid = left + (right - left) / 2
            let root = TreeNode(values[mid])
            root.left = build(left, mid - 1)
            root.right = build(mid + 1, right)
            return root
        }

        return build(0, values.count - 1)
    }
}
