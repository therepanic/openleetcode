impl Solution {
    pub fn maximum_units(box_types: Vec<Vec<i32>>, truck_size: i32) -> i32 {
        let mut boxes = box_types;
        boxes.sort_by(|a, b| b[1].cmp(&a[1]));
        let mut remaining = truck_size;
        let mut ans = 0;
        for boxx in boxes {
            let quantitytaken = remaining.min(boxx[0]);
            ans += boxx[1] * quantitytaken;
            remaining -= quantitytaken;
            if remaining == 0 { break; }
        }
        ans
    }
}
