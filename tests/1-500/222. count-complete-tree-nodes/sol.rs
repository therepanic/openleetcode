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
    pub fn count_nodes(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        if root.is_none() {
            return 0;
        }
        
        let root_node = root.as_ref().unwrap().borrow();
        let left_depth = Self::get_depth(root_node.left.clone());
        let right_depth = Self::get_depth(root_node.right.clone());
        
        if left_depth == right_depth {
            return (1 << left_depth) + Self::count_nodes(root_node.right.clone());
        } else {
            return (1 << right_depth) + Self::count_nodes(root_node.left.clone());
        }
    }
    
    fn get_depth(node: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        let mut depth = 0;
        let mut current = node;
        while let Some(n) = current {
            depth += 1;
            current = n.borrow().left.clone();
        }
        depth
    }
}
