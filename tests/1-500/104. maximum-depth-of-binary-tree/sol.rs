
impl Solution {
    pub fn max_depth(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        match root {
            None => 0,
            Some(node) => {
                let (left, right) = {
                    let borrowed = node.borrow();
                    (borrowed.left.clone(), borrowed.right.clone())
                };
                1 + Self::max_depth(left).max(Self::max_depth(right))
            }
        }
    }
}
