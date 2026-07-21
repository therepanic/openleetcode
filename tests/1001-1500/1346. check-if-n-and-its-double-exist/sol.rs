impl Solution {
    pub fn check_if_exist(arr: Vec<i32>) -> bool {
        if arr.iter().filter(|&&x| x == 0).count() >= 2 {
            return true;
        }

        for &i in &arr {
            if i != 0 && arr.contains(&(i * 2)) {
                return true;
            }
        }
        false
    }
}
