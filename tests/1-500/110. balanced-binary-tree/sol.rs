
impl Solution {
    pub fn is_balanced(root: Option<Rc<RefCell<TreeNode>>>) -> bool {
        fn height(node: Option<Rc<RefCell<TreeNode>>>) -> i32 {
            match node {
                None => 0,
                Some(node) => {
                    let (left, right) = {
                        let borrowed = node.borrow();
                        (borrowed.left.clone(), borrowed.right.clone())
                    };
                    let left_height = height(left);
                    if left_height == -1 {
                        return -1;
                    }
                    let right_height = height(right);
                    if right_height == -1 {
                        return -1;
                    }
                    if (left_height - right_height).abs() > 1 {
                        -1
                    } else {
                        1 + left_height.max(right_height)
                    }
                }
            }
        }
        height(root) != -1
    }
}
