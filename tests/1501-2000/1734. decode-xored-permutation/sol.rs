impl Solution {
    pub fn decode(encoded: Vec<i32>) -> Vec<i32> {
        let n = encoded.len() + 1;
        let mut xr = 0;
        for i in 1..=n { xr ^= i as i32; }
        let mut nxr = 0;
        for (i, &v) in encoded.iter().enumerate() {
            if i % 2 == 1 { nxr ^= v; }
        }
        let mut perm = vec![0; n];
        perm[0] = xr ^ nxr;
        for i in 0..encoded.len() {
            perm[i + 1] = encoded[i] ^ perm[i];
        }
        perm
    }
}
