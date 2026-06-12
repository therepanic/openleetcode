
impl Solution {
    pub fn zigzag_level_order(root: Option<Rc<RefCell<TreeNode>>>) -> Vec<Vec<i32>> {
        let mut result = Vec::new();
        let mut queue = VecDeque::new();
        if let Some(node) = root {
            queue.push_back(node);
        } else {
            return result;
        }
        let mut left_to_right = true;

        while !queue.is_empty() {
            let size = queue.len();
            let mut level = vec![0; size];
            for i in 0..size {
                let node = queue.pop_front().unwrap();
                let borrowed = node.borrow();
                let idx = if left_to_right { i } else { size - 1 - i };
                level[idx] = borrowed.val;
                if let Some(left) = borrowed.left.clone() {
                    queue.push_back(left);
                }
                if let Some(right) = borrowed.right.clone() {
                    queue.push_back(right);
                }
            }
            result.push(level);
            left_to_right = !left_to_right;
        }
        result
    }
}
