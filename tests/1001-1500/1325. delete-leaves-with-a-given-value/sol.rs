// Definition for a binary tree node.
// #[derive(Debug, PartialEq, Eq)]
// pub struct TreeNode {
//   pub val: i32,
//   pub left: Option<Rc<RefCell<TreeNode>>>,
//   pub right: Option<Rc<RefCell<TreeNode>>>,
// }
// 
// impl TreeNode {
//   #[inline]
//   pub fn new(val: i32) -> Self {
//     TreeNode {
//       val,
//       left: None,
//       right: None
//     }
//   }
// }
impl Solution {
    pub fn remove_leaf_nodes(root: Option<Rc<RefCell<TreeNode>>>, target: i32) -> Option<Rc<RefCell<TreeNode>>> {
        fn traverse_and_remove(temp: Option<Rc<RefCell<TreeNode>>>, target: i32) -> bool {
            match temp {
                None => false,
                Some(node) => {
                    let node_ref = node.borrow();
                    if node_ref.left.is_none() && node_ref.right.is_none() {
                        return node_ref.val != target;
                    }
                    drop(node_ref);
                    
                    let left_result = {
                        let left_child = node.borrow().left.clone();
                        traverse_and_remove(left_child, target)
                    };
                    let right_result = {
                        let right_child = node.borrow().right.clone();
                        traverse_and_remove(right_child, target)
                    };
                    
                    if !left_result {
                        node.borrow_mut().left = None;
                    }
                    if !right_result {
                        node.borrow_mut().right = None;
                    }
                    
                    left_result || right_result || node.borrow().val != target
                }
            }
        }
        
        if !traverse_and_remove(root.clone(), target) {
            return None;
        }
        return root;
    }
}
