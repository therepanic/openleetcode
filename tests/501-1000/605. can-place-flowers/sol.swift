class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        if n == 0 { return true }
        var flowerbed = flowerbed
        var n = n
        let length = flowerbed.count
        for i in 0..<length {
            if flowerbed[i] == 0 {
                let left = (i == 0) || (flowerbed[i-1] == 0)
                let right = (i == length-1) || (flowerbed[i+1] == 0)
                if left && right {
                    flowerbed[i] = 1
                    n -= 1
                    if n == 0 { return true }
                }
            }
        }
        return false
    }
}
