impl Solution {
    pub fn three_equal_parts(arr: Vec<i32>) -> Vec<i32> {
        let n = arr.len() as i32;
        let ones: i32 = arr.iter().sum();
        if ones == 0 {
            return vec![0, n - 1];
        }
        if ones % 3 != 0 {
            return vec![-1, -1];
        }

        let k = ones / 3;
        let mut i1 = -1;
        let mut i2 = -1;
        let mut i3 = -1;
        let mut seen = 0;
        for (i, &x) in arr.iter().enumerate() {
            if x == 1 {
                seen += 1;
                if seen == 1 {
                    i1 = i as i32;
                } else if seen == k + 1 {
                    i2 = i as i32;
                } else if seen == 2 * k + 1 {
                    i3 = i as i32;
                    break;
                }
            }
        }

        let len = n - i3;
        if i1 + len > i2 || i2 + len > i3 {
            return vec![-1, -1];
        }
        for offset in 0..len {
            let a = arr[(i1 + offset) as usize];
            if a != arr[(i2 + offset) as usize] || a != arr[(i3 + offset) as usize] {
                return vec![-1, -1];
            }
        }
        vec![i1 + len - 1, i2 + len]
    }
}
