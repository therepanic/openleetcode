impl Solution {
    pub fn group_the_people(group_sizes: Vec<i32>) -> Vec<Vec<i32>> {
        use std::collections::HashMap;
        let mut ans: Vec<Vec<i32>> = Vec::new();
        let mut mp: HashMap<i32, Vec<i32>> = HashMap::new();
        for (i, &v) in group_sizes.iter().enumerate() {
            let list = mp.entry(v).or_insert_with(Vec::new);
            list.push(i as i32);
            if list.len() == v as usize {
                ans.push(list.clone());
                mp.insert(v, Vec::new());
            }
        }
        ans
    }
}
