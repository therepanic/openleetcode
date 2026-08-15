use std::collections::HashMap;

struct TrieNode {
    count: i32,
    child: HashMap<i32, usize>,
}

struct Trie {
    nodes: Vec<TrieNode>,
}

impl Trie {
    fn new() -> Self {
        Trie { nodes: vec![TrieNode { count: 0, child: HashMap::new() }] }
    }

    fn increase(&mut self, num: i32, delta: i32) {
        let mut cur = 0;
        for i in (0..=17).rev() {
            let bit = (num >> i) & 1;
            let next = {
                let node = &self.nodes[cur];
                if let Some(&n) = node.child.get(&bit) {
                    n
                } else {
                    let new_node = TrieNode { count: 0, child: HashMap::new() };
                    self.nodes.push(new_node);
                    let idx = self.nodes.len() - 1;
                    self.nodes[cur].child.insert(bit, idx);
                    idx
                }
            };
            cur = next;
            self.nodes[cur].count += delta;
        }
    }

    fn find_max(&self, num: i32) -> i32 {
        let mut cur = 0;
        let mut ans = 0;
        for i in (0..=17).rev() {
            let bit = (num >> i) & 1;
            let desired = 1 - bit;
            if let Some(&n) = self.nodes[cur].child.get(&desired) {
                if self.nodes[n].count > 0 {
                    cur = n;
                    ans |= (1 << i);
                    continue;
                }
            }
            cur = self.nodes[cur].child[&bit];
        }
        ans
    }
}

impl Solution {
    pub fn max_genetic_difference(parents: Vec<i32>, queries: Vec<Vec<i32>>) -> Vec<i32> {
        let n = parents.len();
        let mut adj = vec![Vec::new(); n];
        let mut root = 0;
        for i in 0..n {
            if parents[i] == -1 {
                root = i;
            } else {
                adj[parents[i] as usize].push(i);
            }
        }

        let mut trie = Trie::new();
        let mut qmap: HashMap<i32, Vec<(usize, i32)>> = HashMap::new();
        for (i, q) in queries.iter().enumerate() {
            qmap.entry(q[0]).or_insert(Vec::new()).push((i, q[1]));
        }

        let mut ans = vec![0; queries.len()];

        fn dfs(u: usize, adj: &Vec<Vec<usize>>, trie: &mut Trie, qmap: &HashMap<i32, Vec<(usize, i32)>>, ans: &mut Vec<i32>) {
            trie.increase(u as i32, 1);
            if let Some(queries) = qmap.get(&(u as i32)) {
                for &(idx, val) in queries {
                    ans[idx] = trie.find_max(val);
                }
            }
            for &v in &adj[u] {
                dfs(v, adj, trie, qmap, ans);
            }
            trie.increase(u as i32, -1);
        }

        dfs(root, &adj, &mut trie, &qmap, &mut ans);
        ans
    }
}
