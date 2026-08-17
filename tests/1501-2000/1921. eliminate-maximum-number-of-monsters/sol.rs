impl Solution {
    pub fn eliminate_maximum(dist: Vec<i32>, speed: Vec<i32>) -> i32 {
        let mut arrival: Vec<i32> = Vec::new();
        for i in 0..dist.len() {
            arrival.push((dist[i] + speed[i] - 1) / speed[i]);
        }
        arrival.sort();
        for (minute, &time) in arrival.iter().enumerate() {
            if time <= minute as i32 {
                return minute as i32;
            }
        }
        arrival.len() as i32
    }
}
