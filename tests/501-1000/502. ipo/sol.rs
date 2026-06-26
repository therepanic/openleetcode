impl Solution {
    pub fn find_maximized_capital(k: i32, w: i32, profits: Vec<i32>, capital: Vec<i32>) -> i32 {
        let n = profits.len();
        let mut projects: Vec<(i32, i32)> = capital.into_iter().zip(profits.into_iter()).collect();
        projects.sort_by_key(|&(c, _)| c);
        let mut max_heap = std::collections::BinaryHeap::new();
        let mut i = 0;
        let mut w = w;
        for _ in 0..k {
            while i < n && projects[i].0 <= w {
                max_heap.push(projects[i].1);
                i += 1;
            }
            if max_heap.is_empty() {
                break;
            }
            w += max_heap.pop().unwrap();
        }
        w
    }
}
