impl Solution {
    pub fn sort_by_bits(arr: Vec<i32>) -> Vec<i32> {
        let mut arr = arr;
        arr.sort_by(|a, b| {
            let ca = a.count_ones();
            let cb = b.count_ones();
            if ca != cb {
                ca.cmp(&cb)
            } else {
                a.cmp(b)
            }
        });
        arr
    }
}
