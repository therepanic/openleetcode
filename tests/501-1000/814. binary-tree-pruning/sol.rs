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
    pub fn prune_tree(root: Option<Rc<RefCell<TreeNode>>>) -> Option<Rc<RefCell<TreeNode>>> {
        fn traverse_and_remove(temp: Option<Rc<RefCell<TreeNode>>>) -> bool {
            match temp {
                None => false,
                Some(node) => {
                    let node_ref = node.borrow();
                    if node_ref.left.is_none() && node_ref.right.is_none() {
                        return node_ref.val == 1;
                    }
                    drop(node_ref);
                    
                    let mut node_mut = node.borrow_mut();
                    let left = traverse_and_remove(node_mut.left.clone());
                    let right = traverse_and_remove(node_mut.right.clone());
                    if !left {
                        node_mut.left = None;
                    }
                    if !right {
                        node_mut.right = None;
                    }
                    left || right || node_mut.val == 1
                }
            }
        }
        
        traverse_and_remove(root.clone());
        match root {
            Some(ref node) => {
                let node_ref = node.borrow();
                if node_ref.left.is_none() && node_ref.right.is_none() && node_ref.val == 0 {
                    return None;
                }
            }
            None => {}
        }
        root
    }
}
