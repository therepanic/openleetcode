use std::collections::{HashSet, VecDeque};

impl Solution {
    pub fn del_nodes(root: Option<Rc<RefCell<TreeNode>>>, to_delete: Vec<i32>) -> Vec<Option<Rc<RefCell<TreeNode>>>> {
        let mut ans: Vec<Option<Rc<RefCell<TreeNode>>>> = Vec::new();
        if root.is_none() {
            return ans;
        }

        let st: HashSet<i32> = to_delete.into_iter().collect();

        let ref_node = Rc::new(RefCell::new(TreeNode::new(-1)));
        ref_node.borrow_mut().left = root;

        let mut q1: VecDeque<Rc<RefCell<TreeNode>>> = VecDeque::new();
        let mut to_process: VecDeque<Rc<RefCell<TreeNode>>> = VecDeque::new();
        to_process.push_back(ref_node.clone());

        while let Some(new_tree) = to_process.pop_front() {
            let mut new_tree_borrow = new_tree.borrow_mut();

            if let Some(left) = new_tree_borrow.left.take() {
                let left_val = left.borrow().val;
                if st.contains(&left_val) {
                    drop(new_tree_borrow);
                    to_process.push_back(left);
                    new_tree_borrow = new_tree.borrow_mut();
                } else {
                    ans.push(Some(left.clone()));
                    q1.push_back(left.clone());
                }
                new_tree_borrow.left = None;
            }

            if let Some(right) = new_tree_borrow.right.take() {
                let right_val = right.borrow().val;
                if st.contains(&right_val) {
                    drop(new_tree_borrow);
                    to_process.push_back(right);
                    new_tree_borrow = new_tree.borrow_mut();
                } else {
                    ans.push(Some(right.clone()));
                    q1.push_back(right.clone());
                }
                new_tree_borrow.right = None;
            }
            drop(new_tree_borrow);

            while let Some(temp) = q1.pop_front() {
                let mut temp_borrow = temp.borrow_mut();

                if let Some(left) = temp_borrow.left.take() {
                    let left_val = left.borrow().val;
                    if st.contains(&left_val) {
                        drop(temp_borrow);
                        to_process.push_back(left);
                        temp_borrow = temp.borrow_mut();
                        temp_borrow.left = None;
                    } else {
                        q1.push_back(left.clone());
                        temp_borrow.left = Some(left);
                    }
                }

                if let Some(right) = temp_borrow.right.take() {
                    let right_val = right.borrow().val;
                    if st.contains(&right_val) {
                        drop(temp_borrow);
                        to_process.push_back(right);
                        temp_borrow = temp.borrow_mut();
                        temp_borrow.right = None;
                    } else {
                        q1.push_back(right.clone());
                        temp_borrow.right = Some(right);
                    }
                }
            }
        }

        ans
    }
}
