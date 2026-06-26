impl Solution {
    pub fn valid_square(p1: Vec<i32>, p2: Vec<i32>, p3: Vec<i32>, p4: Vec<i32>) -> bool {
        fn get_dist_sq(pt1: &Vec<i32>, pt2: &Vec<i32>) -> i32 {
            (pt1[0] - pt2[0]).pow(2) + (pt1[1] - pt2[1]).pow(2)
        }
        
        let points = vec![p1, p2, p3, p4];
        let mut distances = std::collections::HashSet::new();
        
        for i in 0..4 {
            for j in i+1..4 {
                distances.insert(get_dist_sq(&points[i], &points[j]));
            }
        }
        
        distances.len() == 2 && !distances.contains(&0)
    }
}
