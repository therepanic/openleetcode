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
    pub fn get_all_elements(root1: Option<Rc<RefCell<TreeNode>>>, root2: Option<Rc<RefCell<TreeNode>>>) -> Vec<i32> {
        let mut stack1: Vec<Rc<RefCell<TreeNode>>> = Vec::new();
        let mut stack2: Vec<Rc<RefCell<TreeNode>>> = Vec::new();
        let mut output: Vec<i32> = Vec::new();
        let mut r1 = root1.clone();
        let mut r2 = root2.clone();
        
        while r1.is_some() || r2.is_some() || !stack1.is_empty() || !stack2.is_empty() {
            while let Some(node) = r1 {
                r1 = node.borrow().left.clone();
                stack1.push(node);
            }
            while let Some(node) = r2 {
                r2 = node.borrow().left.clone();
                stack2.push(node);
            }

            if !stack1.is_empty() && !stack2.is_empty() {
                if stack1.last().unwrap().borrow().val <= stack2.last().unwrap().borrow().val {
                    r1 = stack1.pop();
                    output.push(r1.as_ref().unwrap().borrow().val);
                    r1 = r1.unwrap().borrow().right.clone();
                } else {
                    r2 = stack2.pop();
                    output.push(r2.as_ref().unwrap().borrow().val);
                    r2 = r2.unwrap().borrow().right.clone();
                }
            } else if stack1.is_empty() {
                r2 = stack2.pop();
                output.push(r2.as_ref().unwrap().borrow().val);
                r2 = r2.unwrap().borrow().right.clone();
            } else {
                r1 = stack1.pop();
                output.push(r1.as_ref().unwrap().borrow().val);
                r1 = r1.unwrap().borrow().right.clone();
            }
        }
        
        output
    }
}
