
impl Solution {
    pub fn sorted_array_to_bst(nums: Vec<i32>) -> Option<Rc<RefCell<TreeNode>>> {
        fn build(nums: &Vec<i32>, left: i32, right: i32) -> Option<Rc<RefCell<TreeNode>>> {
            if left > right {
                return None;
            }
            let mid = left + (right - left + 1) / 2;
            let root = Rc::new(RefCell::new(TreeNode::new(nums[mid as usize])));
            {
                let mut borrowed = root.borrow_mut();
                borrowed.left = build(nums, left, mid - 1);
                borrowed.right = build(nums, mid + 1, right);
            }
            Some(root)
        }
        build(&nums, 0, nums.len() as i32 - 1)
    }
}
