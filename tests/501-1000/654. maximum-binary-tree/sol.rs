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
    pub fn construct_maximum_binary_tree(nums: Vec<i32>) -> Option<Rc<RefCell<TreeNode>>> {
        let mut stack: Vec<Rc<RefCell<TreeNode>>> = Vec::new();
        
        for num in nums {
            let current = Rc::new(RefCell::new(TreeNode::new(num)));
            
            while let Some(last) = stack.last() {
                if last.borrow().val < num {
                    current.borrow_mut().left = Some(Rc::clone(last));
                    stack.pop();
                } else {
                    break;
                }
            }
            
            if let Some(last) = stack.last() {
                last.borrow_mut().right = Some(Rc::clone(&current));
            }
            
            stack.push(current);
        }
        
        stack.into_iter().next()
    }
}
