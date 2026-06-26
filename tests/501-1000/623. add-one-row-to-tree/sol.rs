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
    pub fn add_one_row(root: Option<Rc<RefCell<TreeNode>>>, val: i32, depth: i32) -> Option<Rc<RefCell<TreeNode>>> {
        if depth == 1 {
            let new_root = Rc::new(RefCell::new(TreeNode::new(val)));
            new_root.borrow_mut().left = root;
            return Some(new_root);
        }
        
        fn construct(node: Option<Rc<RefCell<TreeNode>>>, val: i32, depth: i32, count: i32) {
            if let Some(n) = node {
                let mut n = n.borrow_mut();
                if count == depth - 1 {
                    let new_left = Rc::new(RefCell::new(TreeNode::new(val)));
                    new_left.borrow_mut().left = n.left.take();
                    n.left = Some(new_left);
                    
                    let new_right = Rc::new(RefCell::new(TreeNode::new(val)));
                    new_right.borrow_mut().right = n.right.take();
                    n.right = Some(new_right);
                    return;
                }
                let left = n.left.clone();
                let right = n.right.clone();
                drop(n);
                construct(left, val, depth, count + 1);
                construct(right, val, depth, count + 1);
            }
        }
        
        construct(root.clone(), val, depth, 1);
        root
    }
}
