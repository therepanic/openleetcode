/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func pseudoPalindromicPaths (root *TreeNode) int {
    count := 0
    counter := [10]int{}

    var checkPalindromic func() bool
    checkPalindromic = func() bool {
        odd := 0
        for i := 1; i <= 9; i++ {
            if counter[i] % 2 == 1 {
                odd++
                if odd > 1 {
                    return false
                }
            }
        }
        return true
    }

    var dfs func(*TreeNode)
    dfs = func(node *TreeNode) {
        if node == nil {
            return
        }

        counter[node.Val]++

        if node.Left == nil && node.Right == nil {
            if checkPalindromic() {
                count++
            }
        } else {
            dfs(node.Left)
            dfs(node.Right)
        }

        counter[node.Val]--
    }

    dfs(root)
    return count
}
