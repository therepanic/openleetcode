impl Solution {
    pub fn distance_between_bus_stops(distance: Vec<i32>, start: i32, destination: i32) -> i32 {
        let (mut s, mut d) = (start as usize, destination as usize);
        if d < s {
            std::mem::swap(&mut s, &mut d);
        }
        let clockwise: i32 = distance[s..d].iter().sum();
        let total: i32 = distance.iter().sum();
        clockwise.min(total - clockwise)
    }
}
