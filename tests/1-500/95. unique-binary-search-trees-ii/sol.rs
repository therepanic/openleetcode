impl Solution {
    pub fn generate_trees(n: i32) -> Vec<Option<Rc<RefCell<TreeNode>>>> {
        fn build(start: i32, end: i32) -> Vec<Option<Rc<RefCell<TreeNode>>>> {
            if start > end {
                return vec![None];
            }

            let mut trees = Vec::new();
            for root_value in start..=end {
                let left_trees = build(start, root_value - 1);
                let right_trees = build(root_value + 1, end);
                for left in &left_trees {
                    for right in &right_trees {
                        let root = Rc::new(RefCell::new(TreeNode::new(root_value)));
                        {
                            let mut node = root.borrow_mut();
                            node.left = left.clone();
                            node.right = right.clone();
                        }
                        trees.push(Some(root));
                    }
                }
            }

            trees
        }

        if n == 0 {
            Vec::new()
        } else {
            build(1, n)
        }
    }
}
