
class Solution {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var index = [Int: Int]()
        for (i, value) in inorder.enumerated() {
            index[value] = i
        }
        var postIndex = postorder.count - 1

        func build(_ left: Int, _ right: Int) -> TreeNode? {
            if left > right { return nil }
            let rootVal = postorder[postIndex]
            postIndex -= 1
            let root = TreeNode(rootVal)
            let mid = index[rootVal]!
            root.right = build(mid + 1, right)
            root.left = build(left, mid - 1)
            return root
        }

        return build(0, inorder.count - 1)
    }
}
