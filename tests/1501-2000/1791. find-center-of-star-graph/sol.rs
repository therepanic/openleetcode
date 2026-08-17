impl Solution {
    pub fn find_center(edges: Vec<Vec<i32>>) -> i32 {
        let a = edges[0][0];
        let b = edges[0][1];
        let c = edges[1][0];
        let d = edges[1][1];
        if a == c || a == d {
            a
        } else {
            b
        }
    }
}
