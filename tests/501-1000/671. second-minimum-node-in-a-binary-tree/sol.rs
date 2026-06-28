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
    pub fn find_second_minimum_value(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        let first = root.as_ref().unwrap().borrow().val;
        let mut second: Option<i32> = None;
        
        fn dfs(node: Option<Rc<RefCell<TreeNode>>>, first: i32, second: &mut Option<i32>) {
            if let Some(n) = node {
                let val = n.borrow().val;
                if val > first {
                    *second = Some(match *second {
                        Some(curr) => curr.min(val),
                        None => val,
                    });
                }
                dfs(n.borrow().left.clone(), first, second);
                dfs(n.borrow().right.clone(), first, second);
            }
        }
        
        dfs(root, first, &mut second);
        second.unwrap_or(-1)
    }
}
