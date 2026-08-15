impl Solution {
    pub fn can_form_array(arr: Vec<i32>, pieces: Vec<Vec<i32>>) -> bool {
        let mut a: Vec<i32> = Vec::new();
        let mut remaining = pieces.clone();
        for &i in &arr {
            for j in 0..remaining.len() {
                if remaining[j].contains(&i) {
                    a.extend(&remaining[j]);
                    remaining.remove(j);
                    break;
                }
            }
        }
        a == arr
    }
}
