impl Solution {
    pub fn compare_version(version1: String, version2: String) -> i32 {
        let a: Vec<i32> = version1.split('.').map(|s| s.parse::<i32>().unwrap()).collect();
        let b: Vec<i32> = version2.split('.').map(|s| s.parse::<i32>().unwrap()).collect();
        let n = a.len().max(b.len());
        for i in 0..n {
            let x = if i < a.len() { a[i] } else { 0 };
            let y = if i < b.len() { b[i] } else { 0 };
            if x < y {
                return -1;
            }
            if x > y {
                return 1;
            }
        }
        0
    }
}
