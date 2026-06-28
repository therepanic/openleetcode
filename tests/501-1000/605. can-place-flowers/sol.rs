impl Solution {
    pub fn can_place_flowers(flowerbed: Vec<i32>, n: i32) -> bool {
        if n == 0 {
            return true;
        }
        let mut flowerbed = flowerbed;
        let mut n = n;
        let length = flowerbed.len();
        for i in 0..length {
            if flowerbed[i] == 0 {
                let left = (i == 0) || (flowerbed[i-1] == 0);
                let right = (i == length-1) || (flowerbed[i+1] == 0);
                if left && right {
                    flowerbed[i] = 1;
                    n -= 1;
                    if n == 0 {
                        return true;
                    }
                }
            }
        }
        false
    }
}
