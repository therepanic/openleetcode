impl Solution {
    pub fn decode(encoded: Vec<i32>, first: i32) -> Vec<i32> {
        let mut arr = vec![first];
        for &e in encoded.iter() {
            arr.push(arr[arr.len()-1] ^ e);
        }
        arr
    }
}
