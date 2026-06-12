
impl Solution {
    pub fn build_tree(inorder: Vec<i32>, postorder: Vec<i32>) -> Option<Rc<RefCell<TreeNode>>> {
        let mut index = HashMap::new();
        for (i, &value) in inorder.iter().enumerate() {
            index.insert(value, i as i32);
        }
        let mut post_index = postorder.len() as i32 - 1;

        fn build(
            postorder: &Vec<i32>,
            index: &HashMap<i32, i32>,
            post_index: &mut i32,
            left: i32,
            right: i32,
        ) -> Option<Rc<RefCell<TreeNode>>> {
            if left > right {
                return None;
            }
            let root_val = postorder[*post_index as usize];
            *post_index -= 1;
            let mid = index[&root_val];
            let root = Rc::new(RefCell::new(TreeNode::new(root_val)));
            {
                let mut borrowed = root.borrow_mut();
                borrowed.right = build(postorder, index, post_index, mid + 1, right);
                borrowed.left = build(postorder, index, post_index, left, mid - 1);
            }
            Some(root)
        }

        build(&postorder, &index, &mut post_index, 0, inorder.len() as i32 - 1)
    }
}
