impl Solution {
    pub fn count_largest_group(n: i32) -> i32 {
        use std::collections::HashMap;
        let mut mpp: HashMap<i32, i32> = HashMap::new();
        let mut maxi = 0;
        let mut count = 0;

        for i in 1..=n {
            let x = Self::digsum(i);
            let entry = mpp.entry(x).or_insert(0);
            *entry += 1;
            maxi = maxi.max(*entry);
        }

        for &v in mpp.values() {
            if v == maxi {
                count += 1;
            }
        }
        count
    }

    fn digsum(mut n: i32) -> i32 {
        let mut s = 0;
        while n > 0 {
            s += n % 10;
            n /= 10;
        }
        s
    }
}
