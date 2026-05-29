#[derive(Clone, Debug)]
pub enum JsonValue {
    Null,
    Bool(bool),
    Number(f64),
    String(String),
    Array(Vec<JsonValue>),
    Object(BTreeMap<String, JsonValue>),
}

#[derive(Clone, Debug)]
pub struct TestInput {
    pub val: JsonValue,
}

struct JsonParser<'a> {
    src: &'a [u8],
    pos: usize,
}

impl<'a> JsonParser<'a> {
    fn new(src: &'a str) -> Self {
        Self { src: src.as_bytes(), pos: 0 }
    }

    fn parse_value(&mut self) -> JsonValue {
        self.skip_ws();
        match self.peek() {
            Some(b'n') => {
                self.expect_bytes(b"null");
                JsonValue::Null
            }
            Some(b't') => {
                self.expect_bytes(b"true");
                JsonValue::Bool(true)
            }
            Some(b'f') => {
                self.expect_bytes(b"false");
                JsonValue::Bool(false)
            }
            Some(b'"') => JsonValue::String(self.parse_string()),
            Some(b'[') => self.parse_array(),
            Some(b'{') => self.parse_object(),
            Some(b'-') | Some(b'0'..=b'9') => self.parse_number(),
            _ => panic!("invalid json"),
        }
    }

    fn parse_array(&mut self) -> JsonValue {
        self.expect(b'[');
        let mut items = Vec::new();
        loop {
            self.skip_ws();
            if self.try_consume(b']') {
                break;
            }
            items.push(self.parse_value());
            self.skip_ws();
            if self.try_consume(b']') {
                break;
            }
            self.expect(b',');
        }
        JsonValue::Array(items)
    }

    fn parse_object(&mut self) -> JsonValue {
        self.expect(b'{');
        let mut map = BTreeMap::new();
        loop {
            self.skip_ws();
            if self.try_consume(b'}') {
                break;
            }
            let key = self.parse_string();
            self.skip_ws();
            self.expect(b':');
            let value = self.parse_value();
            map.insert(key, value);
            self.skip_ws();
            if self.try_consume(b'}') {
                break;
            }
            self.expect(b',');
        }
        JsonValue::Object(map)
    }

    fn parse_number(&mut self) -> JsonValue {
        let start = self.pos;
        if self.peek() == Some(b'-') {
            self.pos += 1;
        }
        while matches!(self.peek(), Some(b'0'..=b'9')) {
            self.pos += 1;
        }
        if self.peek() == Some(b'.') {
            self.pos += 1;
            while matches!(self.peek(), Some(b'0'..=b'9')) {
                self.pos += 1;
            }
        }
        if matches!(self.peek(), Some(b'e') | Some(b'E')) {
            self.pos += 1;
            if matches!(self.peek(), Some(b'+') | Some(b'-')) {
                self.pos += 1;
            }
            while matches!(self.peek(), Some(b'0'..=b'9')) {
                self.pos += 1;
            }
        }
        let s = std::str::from_utf8(&self.src[start..self.pos]).unwrap();
        JsonValue::Number(s.parse::<f64>().unwrap())
    }

    fn parse_string(&mut self) -> String {
        self.expect(b'"');
        let mut out = String::new();
        while let Some(ch) = self.next() {
            match ch {
                b'"' => break,
                b'\\' => {
                    let esc = self.next().unwrap();
                    match esc {
                        b'"' => out.push('"'),
                        b'\\' => out.push('\\'),
                        b'/' => out.push('/'),
                        b'b' => out.push('\u{0008}'),
                        b'f' => out.push('\u{000c}'),
                        b'n' => out.push('\n'),
                        b'r' => out.push('\r'),
                        b't' => out.push('\t'),
                        b'u' => {
                            let hex = std::str::from_utf8(&self.src[self.pos..self.pos + 4]).unwrap();
                            self.pos += 4;
                            let code = u16::from_str_radix(hex, 16).unwrap();
                            out.push(char::from_u32(code as u32).unwrap());
                        }
                        _ => panic!("invalid escape"),
                    }
                }
                _ => out.push(ch as char),
            }
        }
        out
    }

    fn skip_ws(&mut self) {
        while matches!(self.peek(), Some(b' ' | b'\n' | b'\r' | b'\t')) {
            self.pos += 1;
        }
    }

    fn expect_bytes(&mut self, bytes: &[u8]) {
        for &b in bytes {
            self.expect(b);
        }
    }

    fn expect(&mut self, ch: u8) {
        assert_eq!(self.next(), Some(ch));
    }

    fn try_consume(&mut self, ch: u8) -> bool {
        if self.peek() == Some(ch) {
            self.pos += 1;
            true
        } else {
            false
        }
    }

    fn peek(&self) -> Option<u8> {
        self.src.get(self.pos).copied()
    }

    fn next(&mut self) -> Option<u8> {
        let out = self.peek();
        if out.is_some() {
            self.pos += 1;
        }
        out
    }
}

pub fn load_test_data(path: &str) -> BTreeMap<String, BTreeMap<String, TestInput>> {
    let raw = fs::read_to_string(path).unwrap();
    let root = JsonParser::new(&raw).parse_value();
    let mut out = BTreeMap::new();
    if let JsonValue::Object(cases) = root {
        for (case_id, case_val) in cases {
            let mut case_map = BTreeMap::new();
            if let JsonValue::Object(vars) = case_val {
                for (name, var_val) in vars {
                    if let JsonValue::Object(test_input) = var_val {
                        let val = test_input.get("val").cloned().unwrap_or(JsonValue::Null);
                        case_map.insert(name, TestInput { val });
                    }
                }
            }
            out.insert(case_id, case_map);
        }
    }
    out
}

pub fn json_to_i32(v: &JsonValue) -> i32 {
    match v {
        JsonValue::Number(n) => *n as i32,
        _ => 0,
    }
}

pub fn json_to_i64(v: &JsonValue) -> i64 {
    match v {
        JsonValue::Number(n) => *n as i64,
        _ => 0,
    }
}

pub fn json_to_f64(v: &JsonValue) -> f64 {
    match v {
        JsonValue::Number(n) => *n,
        _ => 0.0,
    }
}

pub fn json_to_f32(v: &JsonValue) -> f32 {
    json_to_f64(v) as f32
}

pub fn json_to_bool(v: &JsonValue) -> bool {
    match v {
        JsonValue::Bool(b) => *b,
        _ => false,
    }
}

pub fn json_to_string(v: &JsonValue) -> String {
    match v {
        JsonValue::String(s) => s.clone(),
        JsonValue::Number(n) => n.to_string(),
        JsonValue::Bool(b) => b.to_string(),
        JsonValue::Null => String::new(),
        _ => String::new(),
    }
}

pub fn json_to_char(v: &JsonValue) -> char {
    json_to_string(v).chars().next().unwrap_or('\0')
}

pub fn json_to_i32_array(v: &JsonValue) -> Vec<i32> {
    match v {
        JsonValue::Array(xs) => xs.iter().map(json_to_i32).collect(),
        _ => Vec::new(),
    }
}

pub fn json_to_optional_i32_array(v: &JsonValue) -> Vec<Option<i32>> {
    match v {
        JsonValue::Array(xs) => xs
            .iter()
            .map(|x| match x {
                JsonValue::Null => None,
                _ => Some(json_to_i32(x)),
            })
            .collect(),
        _ => Vec::new(),
    }
}

pub fn json_to_char_matrix(v: &JsonValue) -> Vec<Vec<char>> {
    match v {
        JsonValue::Array(rows) => rows
            .iter()
            .map(|row| match row {
                JsonValue::Array(cols) => cols.iter().map(json_to_char).collect(),
                _ => Vec::new(),
            })
            .collect(),
        _ => Vec::new(),
    }
}

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
        while !queue.is_empty() && i < arr.len() {
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
