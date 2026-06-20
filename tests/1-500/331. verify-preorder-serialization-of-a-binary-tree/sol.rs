impl Solution {
    pub fn is_valid_serialization(preorder: String) -> bool {
        let mut slots = 1;
        for node in preorder.split(',') {
            slots -= 1;
            if slots < 0 {
                return false;
            }
            if node != "#" {
                slots += 2;
            }
        }
        slots == 0
    }
}
