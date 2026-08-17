impl Solution {
    pub fn min_speed_on_time(dist: Vec<i32>, hour: f64) -> i32 {
        if dist.is_empty() {
            return -1;
        }
        
        let can_reach = |speed: i32| -> bool {
            let mut total = 0.0;
            for i in 0..dist.len()-1 {
                total += ((dist[i] + speed - 1) / speed) as f64;
            }
            total += dist[dist.len()-1] as f64 / speed as f64;
            total <= hour
        };
        
        let mut low = 1;
        let mut high = 10000000;
        let mut ans = -1;
        while low <= high {
            let mid = (low + high) / 2;
            if can_reach(mid) {
                ans = mid;
                high = mid - 1;
            } else {
                low = mid + 1;
            }
        }
        ans
    }
}
