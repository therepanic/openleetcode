/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func maxAncestorDiff(root *TreeNode) int {
    m := []int{0}
    dfs(root, m)
    return m[0]
}

func dfs(root *TreeNode, m []int) (int, int) {
    if root == nil {
        return int(^uint(0) >> 1), -int(^uint(0) >> 1) - 1
    }
    leftMin, leftMax := dfs(root.Left, m)
    rightMin, rightMax := dfs(root.Right, m)
    minVal := root.Val
    if leftMin < minVal {
        minVal = leftMin
    }
    if rightMin < minVal {
        minVal = rightMin
    }
    maxVal := root.Val
    if leftMax > maxVal {
        maxVal = leftMax
    }
    if rightMax > maxVal {
        maxVal = rightMax
    }
    diff1 := minVal - root.Val
    if diff1 < 0 {
        diff1 = -diff1
    }
    diff2 := maxVal - root.Val
    if diff2 < 0 {
        diff2 = -diff2
    }
    if diff1 > diff2 {
        if diff1 > m[0] {
            m[0] = diff1
        }
    } else {
        if diff2 > m[0] {
            m[0] = diff2
        }
    }
    return minVal, maxVal
}
