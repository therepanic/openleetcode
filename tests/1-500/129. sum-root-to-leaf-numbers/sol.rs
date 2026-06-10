impl Solution {
    pub fn sum_numbers(root: Option<Rc<RefCell<TreeNode>>>) -> i64 {
        fn dfs(node: Option<Rc<RefCell<TreeNode>>>, current: i64) -> i64 {
            match node {
                None => 0,
                Some(node_rc) => {
                    let (left, right, val) = {
                        let node = node_rc.borrow();
                        (node.left.clone(), node.right.clone(), node.val as i64)
                    };
                    let next = current * 10 + val;
                    if left.is_none() && right.is_none() {
                        next
                    } else {
                        dfs(left, next) + dfs(right, next)
                    }
                }
            }
        }

        dfs(root, 0)
    }
}
