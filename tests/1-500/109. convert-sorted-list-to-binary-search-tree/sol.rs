
impl Solution {
    pub fn sorted_list_to_bst(head: Option<Box<ListNode>>) -> Option<Rc<RefCell<TreeNode>>> {
        let mut values = Vec::new();
        let mut current = head.as_ref();
        while let Some(node) = current {
            values.push(node.val);
            current = node.next.as_ref();
        }

        fn build(values: &Vec<i32>, left: i32, right: i32) -> Option<Rc<RefCell<TreeNode>>> {
            if left > right {
                return None;
            }
            let mid = left + (right - left) / 2;
            let root = Rc::new(RefCell::new(TreeNode::new(values[mid as usize])));
            {
                let mut borrowed = root.borrow_mut();
                borrowed.left = build(values, left, mid - 1);
                borrowed.right = build(values, mid + 1, right);
            }
            Some(root)
        }

        build(&values, 0, values.len() as i32 - 1)
    }
}
