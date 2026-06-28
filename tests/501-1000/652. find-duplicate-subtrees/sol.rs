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
use std::collections::HashMap;

impl Solution {
    pub fn find_duplicate_subtrees(root: Option<Rc<RefCell<TreeNode>>>) -> Vec<Option<Rc<RefCell<TreeNode>>>> {
        let mut seen: HashMap<String, i32> = HashMap::new();
        let mut ans: Vec<Option<Rc<RefCell<TreeNode>>>> = Vec::new();
        
        fn solve(node: &Option<Rc<RefCell<TreeNode>>>, seen: &mut HashMap<String, i32>, ans: &mut Vec<Option<Rc<RefCell<TreeNode>>>>) -> String {
            match node {
                None => "#".to_string(),
                Some(n) => {
                    let n_ref = n.borrow();
                    let left = solve(&n_ref.left, seen, ans);
                    let right = solve(&n_ref.right, seen, ans);
                    let curr_tree = format!("{}, {}, {}", n_ref.val, left, right);
                    let count = seen.entry(curr_tree.clone()).or_insert(0);
                    *count += 1;
                    if *count == 2 {
                        ans.push(Some(Rc::clone(n)));
                    }
                    curr_tree
                }
            }
        }
        
        solve(&root, &mut seen, &mut ans);
        ans
    }
}
