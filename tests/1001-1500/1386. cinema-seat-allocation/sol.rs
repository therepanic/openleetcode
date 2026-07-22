use std::collections::{HashMap, HashSet};

impl Solution {
    pub fn max_number_of_families(n: i32, reserved_seats: Vec<Vec<i32>>) -> i32 {
        let mut row_seats: HashMap<i32, HashSet<i32>> = HashMap::new();
        
        for reservation in reserved_seats {
            let row = reservation[0];
            let seat = reservation[1];
            row_seats.entry(row).or_insert_with(HashSet::new).insert(seat);
        }
        
        let mut ans = (n - row_seats.len() as i32) * 2;
        
        let option1: HashSet<i32> = [2, 3, 4, 5].iter().cloned().collect();
        let option2: HashSet<i32> = [6, 7, 8, 9].iter().cloned().collect();
        let option3: HashSet<i32> = [4, 5, 6, 7].iter().cloned().collect();
        
        for seats in row_seats.values() {
            let mut available = 0;
            if seats.is_disjoint(&option1) {
                available += 1;
            }
            if seats.is_disjoint(&option2) {
                available += 1;
            }
            if seats.is_disjoint(&option3) {
                available = available.max(1);
            }
            ans += available;
        }
        
        ans
    }
}
