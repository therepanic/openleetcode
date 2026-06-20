
impl Solution {
    pub fn build_tree(preorder: Vec<i32>, inorder: Vec<i32>) -> Option<Rc<RefCell<TreeNode>>> {
        let mut index = HashMap::new();
        for (i, &value) in inorder.iter().enumerate() {
            index.insert(value, i as i32);
        }
        let mut preorder_index = 0usize;

        fn build(
            preorder: &Vec<i32>,
            index: &HashMap<i32, i32>,
            preorder_index: &mut usize,
            left: i32,
            right: i32,
        ) -> Option<Rc<RefCell<TreeNode>>> {
            if left > right {
                return None;
            }
            let root_val = preorder[*preorder_index];
            *preorder_index += 1;
            let mid = index[&root_val];
            let root = Rc::new(RefCell::new(TreeNode::new(root_val)));
            {
                let mut borrowed = root.borrow_mut();
                borrowed.left = build(preorder, index, preorder_index, left, mid - 1);
                borrowed.right = build(preorder, index, preorder_index, mid + 1, right);
            }
            Some(root)
        }

        build(&preorder, &index, &mut preorder_index, 0, inorder.len() as i32 - 1)
    }
}
