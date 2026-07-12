func delNodes(root *TreeNode, to_delete []int) []*TreeNode {
    ans := []*TreeNode{}
    if root == nil {
        return ans
    }

    st := make(map[int]bool)
    for _, v := range to_delete {
        st[v] = true
    }

    ref := &TreeNode{Val: -1}
    ref.Left = root

    q1 := []*TreeNode{}
    toProcess := []*TreeNode{ref}

    for len(toProcess) > 0 {
        newTree := toProcess[0]
        toProcess = toProcess[1:]

        if newTree.Left != nil {
            if st[newTree.Left.Val] {
                toProcess = append(toProcess, newTree.Left)
            } else {
                ans = append(ans, newTree.Left)
                q1 = append(q1, newTree.Left)
            }
            newTree.Left = nil
        }

        if newTree.Right != nil {
            if st[newTree.Right.Val] {
                toProcess = append(toProcess, newTree.Right)
            } else {
                ans = append(ans, newTree.Right)
                q1 = append(q1, newTree.Right)
            }
            newTree.Right = nil
        }

        for len(q1) > 0 {
            temp := q1[0]
            q1 = q1[1:]

            if temp.Left != nil {
                if st[temp.Left.Val] {
                    toProcess = append(toProcess, temp.Left)
                    temp.Left = nil
                } else {
                    q1 = append(q1, temp.Left)
                }
            }

            if temp.Right != nil {
                if st[temp.Right.Val] {
                    toProcess = append(toProcess, temp.Right)
                    temp.Right = nil
                } else {
                    q1 = append(q1, temp.Right)
                }
            }
        }
    }

    return ans
}
