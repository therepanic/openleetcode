impl Solution {
    pub fn reordered_power_of2(n: i32) -> bool {
        fn signature(mut num: i32) -> String {
            let mut counts = [0i32; 10];
            if num == 0 {
                counts[0] = 1;
            } else {
                while num > 0 {
                    counts[(num % 10) as usize] += 1;
                    num /= 10;
                }
            }
            let mut out = String::new();
            for count in counts.iter() {
                out.push('#');
                out.push_str(&count.to_string());
            }
            out
        }

        let target = signature(n);
        for i in 0..31 {
            if signature(1 << i) == target {
                return true;
            }
        }
        false
    }
}
