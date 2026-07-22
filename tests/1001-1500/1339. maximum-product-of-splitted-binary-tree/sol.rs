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
    pub fn max_product(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let mut nodes: Vec<Rc<RefCell<TreeNode>>> = Vec::new();
        let mut stack: Vec<Option<Rc<RefCell<TreeNode>>>> = vec![root.clone()];

        while let Some(opt) = stack.pop() {
            if let Some(node) = opt {
                let n = node.borrow();
                stack.push(n.left.clone());
                stack.push(n.right.clone());
                drop(n);
                nodes.push(node);
            }
        }

        let mut sums: HashMap<*const RefCell<TreeNode>, i64> = HashMap::new();
        for node in nodes.iter().rev() {
            let n = node.borrow();
            let left_sum = n.left.as_ref().map_or(0, |l| sums[&Rc::as_ptr(l)]);
            let right_sum = n.right.as_ref().map_or(0, |r| sums[&Rc::as_ptr(r)]);
            sums.insert(Rc::as_ptr(node), n.val as i64 + left_sum + right_sum);
        }

        let total = sums[&Rc::as_ptr(root.as_ref().unwrap())];
        let mut best = 0i64;
        for &sub in sums.values() {
            best = best.max(sub * (total - sub));
        }
        (best % MOD) as i32
    }
}
