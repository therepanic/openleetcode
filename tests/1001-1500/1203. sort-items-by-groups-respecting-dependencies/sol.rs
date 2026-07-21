impl Solution {
    pub fn sort_items(n: i32, m: i32, mut group: Vec<i32>, before_items: Vec<Vec<i32>>) -> Vec<i32> {
        use std::collections::{HashMap, HashSet, VecDeque};
        let n = n as usize;
        let m = m as usize;
        let mut group_to_items: HashMap<i32, HashSet<i32>> = HashMap::new();
        let mut new_group = m as i32;
        for i in 0..n {
            if group[i] == -1 {
                group[i] = new_group;
                new_group += 1;
            }
            group_to_items.entry(group[i]).or_default().insert(i as i32);
        }

        let mut intra_pred: HashMap<i32, HashSet<i32>> = HashMap::new();
        let mut intra_succ: HashMap<i32, HashSet<i32>> = HashMap::new();
        let mut inter_pred: HashMap<i32, HashSet<i32>> = HashMap::new();
        let mut inter_succ: HashMap<i32, HashSet<i32>> = HashMap::new();

        for i in 0..n {
            for &before in &before_items[i] {
                if group[i] == group[before as usize] {
                    intra_pred.entry(i as i32).or_default().insert(before);
                    intra_succ.entry(before).or_default().insert(i as i32);
                } else {
                    inter_pred.entry(group[i]).or_default().insert(group[before as usize]);
                    inter_succ.entry(group[before as usize]).or_default().insert(group[i]);
                }
            }
        }

        fn topo_sort(
            nodes: Vec<i32>,
            pred: &mut HashMap<i32, HashSet<i32>>,
            succ: &HashMap<i32, HashSet<i32>>,
        ) -> Vec<i32> {
            let node_set: HashSet<i32> = nodes.iter().cloned().collect();
            let mut order = Vec::new();
            let mut queue = VecDeque::new();
            for &node in &nodes {
                if pred.get(&node).map_or(true, |s| s.is_empty()) {
                    queue.push_back(node);
                }
            }
            while let Some(node) = queue.pop_front() {
                order.push(node);
                if let Some(neighbors) = succ.get(&node) {
                    for &s in neighbors {
                        if let Some(set) = pred.get_mut(&s) {
                            set.remove(&node);
                            if set.is_empty() {
                                queue.push_back(s);
                            }
                        }
                    }
                }
            }
            if order.len() == nodes.len() { order } else { Vec::new() }
        }

        let group_nodes: Vec<i32> = group_to_items.keys().cloned().collect();
        let groups_order = topo_sort(group_nodes, &mut inter_pred, &inter_succ);
        if groups_order.is_empty() { return Vec::new(); }

        let mut result = Vec::new();
        for grp in groups_order {
            let items: Vec<i32> = group_to_items[&grp].iter().cloned().collect();
            let order = topo_sort(items, &mut intra_pred, &intra_succ);
            if order.is_empty() { return Vec::new(); }
            result.extend(order);
        }
        result
    }
}
