impl Solution {
    pub fn interchangeable_rectangles(rectangles: Vec<Vec<i32>>) -> i64 {
        fn gcd(a: i32, b: i32) -> i32 {
            let (mut a, mut b) = (a, b);
            while b != 0 {
                let temp = a % b;
                a = b;
                b = temp;
            }
            a
        }
        
        use std::collections::HashMap;
        let mut ratio_count: HashMap<(i32, i32), i64> = HashMap::new();
        let mut result: i64 = 0;
        
        for rect in &rectangles {
            let width = rect[0];
            let height = rect[1];
            let g = gcd(width, height);
            let reduced = (width / g, height / g);
            result += *ratio_count.get(&reduced).unwrap_or(&0);
            *ratio_count.entry(reduced).or_insert(0) += 1;
        }
        
        result
    }
}
