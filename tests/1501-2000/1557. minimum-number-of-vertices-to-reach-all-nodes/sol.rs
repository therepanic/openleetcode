impl Solution {
    pub fn find_smallest_set_of_vertices(n: i32, edges: Vec<Vec<i32>>) -> Vec<i32> {
        let mut has_incoming = vec![false; n as usize];
        for edge in &edges {
            has_incoming[edge[1] as usize] = true;
        }
        (0..n).filter(|&i| !has_incoming[i as usize]).collect()
    }
}
