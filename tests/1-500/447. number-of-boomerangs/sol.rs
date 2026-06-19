impl Solution {
    pub fn number_of_boomerangs(points: Vec<Vec<i32>>) -> i32 {
        let mut result = 0;
        for p in &points {
            let mut distances = std::collections::HashMap::new();
            for q in &points {
                let d = (p[0] - q[0]) * (p[0] - q[0]) + (p[1] - q[1]) * (p[1] - q[1]);
                *distances.entry(d).or_insert(0) += 1;
            }
            for &count in distances.values() {
                result += count * (count - 1);
            }
        }
        result
    }
}
