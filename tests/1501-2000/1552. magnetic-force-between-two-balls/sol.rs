impl Solution {
    pub fn max_distance(position: Vec<i32>, m: i32) -> i32 {
        let mut sorted = position;
        sorted.sort();
        let mut right = sorted[sorted.len() - 1] - sorted[0];
        let mut left = 1;
        
        while left <= right {
            let mid = (left + right) / 2;
            let mut my_balls = 1;
            let mut previous = sorted[0];
            
            for &places in &sorted[1..] {
                if places - previous >= mid {
                    my_balls += 1;
                    previous = places;
                }
            }
            
            if my_balls >= m {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        
        right
    }
}
