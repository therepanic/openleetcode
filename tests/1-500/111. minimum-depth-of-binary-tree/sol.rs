
impl Solution {
    pub fn min_depth(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        let mut queue = VecDeque::new();
        if let Some(node) = root {
            queue.push_back((node, 1));
        } else {
            return 0;
        }
        while let Some((node, depth)) = queue.pop_front() {
            let (left, right) = {
                let borrowed = node.borrow();
                (borrowed.left.clone(), borrowed.right.clone())
            };
            if left.is_none() && right.is_none() {
                return depth;
            }
            if let Some(left) = left {
                queue.push_back((left, depth + 1));
            }
            if let Some(right) = right {
                queue.push_back((right, depth + 1));
            }
        }
        0
    }
}
