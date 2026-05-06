#[derive(PartialEq, Eq, Clone, Debug)]
pub struct ListNode {
    pub val: i32,
    pub next: Option<Box<ListNode>>,
}

impl ListNode {
    #[inline]
    pub fn new(val: i32) -> Self {
        ListNode { next: None, val }
    }

    pub fn to_list_node(arr: Vec<i32>) -> Option<Box<ListNode>> {
        let mut head = None;
        for &val in arr.iter().rev() {
            head = Some(Box::new(ListNode { val, next: head }));
        }
        head
    }

    pub fn list_node_to_array(head: Option<Box<ListNode>>) -> Vec<i32> {
        let mut res = Vec::new();
        let mut curr = head;
        while let Some(node) = curr {
            res.push(node.val);
            curr = node.next;
        }
        res
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct TreeNode {
    pub val: i32,
    pub left: Option<Rc<RefCell<TreeNode>>>,
    pub right: Option<Rc<RefCell<TreeNode>>>,
}

impl TreeNode {
    #[inline]
    pub fn new(val: i32) -> Self {
        TreeNode { val, left: None, right: None }
    }

    pub fn to_tree_node(arr: Vec<Option<i32>>) -> Option<Rc<RefCell<TreeNode>>> {
        if arr.is_empty() || arr[0].is_none() { return None; }
        let root = Rc::new(RefCell::new(TreeNode::new(arr[0].unwrap())));
        let mut queue = VecDeque::new();
        queue.push_back(Rc::clone(&root));
        let mut i = 1;
        while i < arr.len() {
            if let Some(curr) = queue.pop_front() {
                if i < arr.len() {
                    if let Some(val) = arr[i] {
                        let left = Rc::new(RefCell::new(TreeNode::new(val)));
                        curr.borrow_mut().left = Some(Rc::clone(&left));
                        queue.push_back(left);
                    }
                    i += 1;
                }
                if i < arr.len() {
                    if let Some(val) = arr[i] {
                        let right = Rc::new(RefCell::new(TreeNode::new(val)));
                        curr.borrow_mut().right = Some(Rc::clone(&right));
                        queue.push_back(right);
                    }
                    i += 1;
                }
            }
        }
        Some(root)
    }

    pub fn tree_node_to_array(root: Option<Rc<RefCell<TreeNode>>>) -> Vec<Option<i32>> {
        let mut res = Vec::new();
        if root.is_none() { return res; }
        let mut queue = VecDeque::new();
        queue.push_back(root);
        while let Some(node_opt) = queue.pop_front() {
            if let Some(node) = node_opt {
                let n = node.borrow();
                res.push(Some(n.val));
                queue.push_back(n.left.clone());
                queue.push_back(n.right.clone());
            } else {
                res.push(None);
            }
        }
        while let Some(None) = res.last() { res.pop(); }
        res
    }
}

pub trait ToJson {
    fn to_json(&self) -> String;
}

impl ToJson for i32 { fn to_json(&self) -> String { self.to_string() } }
impl ToJson for i64 { fn to_json(&self) -> String { self.to_string() } }
impl ToJson for f64 { fn to_json(&self) -> String { self.to_string() } }
impl ToJson for bool { fn to_json(&self) -> String { self.to_string() } }
impl ToJson for String { fn to_json(&self) -> String { format!("\"{}\"", self) } }

impl<T: ToJson> ToJson for Vec<T> {
    fn to_json(&self) -> String {
        let parts: Vec<String> = self.iter().map(|v| v.to_json()).collect();
        format!("[{}]", parts.join(","))
    }
}

impl<T: ToJson> ToJson for Option<T> {
    fn to_json(&self) -> String {
        match self {
            Some(v) => v.to_json(),
            None => "null".to_string(),
        }
    }
}

impl ToJson for Box<ListNode> {
    fn to_json(&self) -> String {
        let mut res = Vec::new();
        let mut curr = Some(self);
        while let Some(node) = curr {
            res.push(node.val);
            curr = node.next.as_ref();
        }
        res.to_json()
    }
}

impl ToJson for Rc<RefCell<TreeNode>> {
    fn to_json(&self) -> String {
        let mut res = Vec::new();
        let mut q = VecDeque::new();
        q.push_back(Some(Rc::clone(self)));
        while let Some(node_opt) = q.pop_front() {
            if let Some(node) = node_opt {
                let n = node.borrow();
                res.push(Some(n.val));
                q.push_back(n.left.clone());
                q.push_back(n.right.clone());
            } else {
                res.push(None);
            }
        }
        while let Some(None) = res.last() { res.pop(); }
        res.to_json()
    }
}

pub fn to_json<T: ToJson>(val: &T) -> String {
    val.to_json()
}
