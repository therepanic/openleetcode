impl Solution {
    pub fn is_covered(ranges: Vec<Vec<i32>>, left: i32, right: i32) -> bool {
        let mut slots = vec![0; 51];
        for r in ranges {
            let (s, e) = (r[0], r[1]);
            for i in s..=e {
                slots[i as usize] = 1;
            }
        }
        for i in left..=right {
            if slots[i as usize] == 0 {
                return false;
            }
        }
        true
    }
}
