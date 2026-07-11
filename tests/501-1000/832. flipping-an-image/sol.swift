class Solution {
    func flipAndInvertImage(_ image: [[Int]]) -> [[Int]] {
        var image = image
        for i in 0..<image.count {
            var left = 0
            var right = image[i].count - 1
            while left <= right {
                let temp = 1 - image[i][right]
                image[i][right] = 1 - image[i][left]
                image[i][left] = temp
                left += 1
                right -= 1
            }
        }
        return image
    }
}
