impl Solution {
    pub fn num_equiv_domino_pairs(dominoes: Vec<Vec<i32>>) -> i32 {
        let mut mpp = vec![0; 100];
        let mut count = 0;
        for d in dominoes {
            let a = d[0];
            let b = d[1];
            let key = if a <= b { a * 10 + b } else { b * 10 + a };
            count += mpp[key as usize];
            mpp[key as usize] += 1;
        }
        count
    }
}
