impl Solution {
    pub fn escape_ghosts(ghosts: Vec<Vec<i32>>, target: Vec<i32>) -> bool {
        let mut a: Vec<i32> = Vec::new();
        for i in &ghosts {
            a.push((i[0] - target[0]).abs() + (i[1] - target[1]).abs());
        }
        
        let z = (target[0] - 0).abs() + (target[1] - 0).abs();
        
        let mut ans = true;
        for i in &a {
            if *i <= z {
                ans = false;
            }
        }
        
        ans
    }
}
