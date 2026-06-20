
func sortedArrayToBST(nums []int) *TreeNode {
    var build func(int, int) *TreeNode
    build = func(left int, right int) *TreeNode {
        if left > right {
            return nil
        }
        mid := left + (right-left+1)/2
        root := &TreeNode{Val: nums[mid]}
        root.Left = build(left, mid-1)
        root.Right = build(mid+1, right)
        return root
    }
    return build(0, len(nums)-1)
}
