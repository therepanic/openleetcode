
class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var index = [Int: Int]()
        for (i, value) in inorder.enumerated() {
            index[value] = i
        }
        var preorderIndex = 0

        func build(_ left: Int, _ right: Int) -> TreeNode? {
            if left > right { return nil }
            let rootVal = preorder[preorderIndex]
            preorderIndex += 1
            let root = TreeNode(rootVal)
            let mid = index[rootVal]!
            root.left = build(left, mid - 1)
            root.right = build(mid + 1, right)
            return root
        }

        return build(0, inorder.count - 1)
    }
}
