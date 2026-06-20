impl Solution {
    pub fn find_radius(houses: Vec<i32>, heaters: Vec<i32>) -> i32 {
        let mut houses = houses;
        let mut heaters = heaters;
        houses.sort();
        heaters.sort();
        let mut radius = 0;
        for house in &houses {
            let mut left = 0;
            let mut right = heaters.len() - 1;
            while left < right {
                let mid = (left + right) / 2;
                if heaters[mid] < *house {
                    left = mid + 1;
                } else {
                    right = mid;
                }
            }
            let mut dist = (heaters[left] - house).abs();
            if left > 0 {
                dist = dist.min((heaters[left - 1] - house).abs());
            }
            radius = radius.max(dist);
        }
        radius
    }
}
