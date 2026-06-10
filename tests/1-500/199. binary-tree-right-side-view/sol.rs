impl Solution {
    pub fn right_side_view(
        root: Option<std::rc::Rc<std::cell::RefCell<TreeNode>>>,
    ) -> Vec<i32> {
        let mut result = Vec::new();
        let mut queue = Vec::new();
        let mut index = 0_usize;
        if let Some(node) = root {
            queue.push(node);
        } else {
            return result;
        }

        while index < queue.len() {
            let level_end = queue.len();
            let mut rightmost = 0;
            while index < level_end {
                let node = queue[index].clone();
                index += 1;
                let borrowed = node.borrow();
                rightmost = borrowed.val;
                if let Some(left) = borrowed.left.clone() {
                    queue.push(left);
                }
                if let Some(right) = borrowed.right.clone() {
                    queue.push(right);
                }
            }
            result.push(rightmost);
        }

        result
    }
}
