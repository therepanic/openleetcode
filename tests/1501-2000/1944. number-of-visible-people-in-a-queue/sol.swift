class Solution {
    func canSeePersonsCount(_ heights: [Int]) -> [Int] {
        let n = heights.count
        var result = [Int](repeating: 0, count: n)
        var stack = [Int]()

        for i in stride(from: n-1, through: 0, by: -1) {
            let height = heights[i]
            var visibility = 0

            while !stack.isEmpty && height > stack.last! {
                stack.removeLast()
                visibility += 1
            }

            if !stack.isEmpty {
                visibility += 1
            }

            result[i] = visibility
            stack.append(height)
        }

        return result
    }
}
