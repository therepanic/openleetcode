impl Solution {
    pub fn max_path_sum(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        fn dfs(node: Option<Rc<RefCell<TreeNode>>>, best: &mut i32) -> i32 {
            match node {
                None => 0,
                Some(node_rc) => {
                    let (left_node, right_node, val) = {
                        let node = node_rc.borrow();
                        (node.left.clone(), node.right.clone(), node.val)
                    };
                    let left = dfs(left_node, best).max(0);
                    let right = dfs(right_node, best).max(0);
                    *best = (*best).max(val + left + right);
                    val + left.max(right)
                }
            }
        }

        let mut best = root.as_ref().unwrap().borrow().val;
        dfs(root, &mut best);
        best
    }
}
