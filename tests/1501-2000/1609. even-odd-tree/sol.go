/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func isEvenOddTree(root *TreeNode) bool {
    elements := [][]int{{}}
    var collect func(*TreeNode, int) bool
    collect = func(temp *TreeNode, pos int) bool {
        if temp == nil {
            return true
        }
        if len(elements) == pos {
            elements = append(elements, []int{})
        }
        posCheck := pos % 2
        valCheck := temp.Val % 2
        if posCheck == 0 && valCheck != 0 {
            if len(elements[pos]) > 0 && !(elements[pos][len(elements[pos])-1] < temp.Val) {
                return false
            }
            elements[pos] = append(elements[pos], temp.Val)
        } else if posCheck != 0 && valCheck == 0 {
            if len(elements[pos]) > 0 && !(elements[pos][len(elements[pos])-1] > temp.Val) {
                return false
            }
            elements[pos] = append(elements[pos], temp.Val)
        } else {
            return false
        }
        return collect(temp.Left, pos+1) && collect(temp.Right, pos+1)
    }
    return collect(root, 0)
}
