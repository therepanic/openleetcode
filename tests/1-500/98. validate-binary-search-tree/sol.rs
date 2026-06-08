impl Solution {
    pub fn is_valid_bst(root: Option<Rc<RefCell<TreeNode>>>) -> bool {
        fn validate(
            node: Option<Rc<RefCell<TreeNode>>>,
            lower: Option<i64>,
            upper: Option<i64>,
        ) -> bool {
            match node {
                None => true,
                Some(node_rc) => {
                    let (left, val, right) = {
                        let node = node_rc.borrow();
                        (node.left.clone(), node.val as i64, node.right.clone())
                    };
                    if lower.map_or(false, |bound| val <= bound)
                        || upper.map_or(false, |bound| val >= bound)
                    {
                        return false;
                    }
                    validate(left, lower, Some(val)) && validate(right, Some(val), upper)
                }
            }
        }

        validate(root, None, None)
    }
}
