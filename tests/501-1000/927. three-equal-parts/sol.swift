class Solution {
    func threeEqualParts(_ arr: [Int]) -> [Int] {
        let ones = arr.reduce(0, +)
        if ones == 0 {
            return [0, arr.count - 1]
        }
        if ones % 3 != 0 {
            return [-1, -1]
        }

        let target = ones / 3
        var first = -1
        var second = -1
        var third = -1
        var seen = 0

        for i in 0..<arr.count {
            if arr[i] == 1 {
                seen += 1
                if seen == 1 {
                    first = i
                } else if seen == target + 1 {
                    second = i
                } else if seen == 2 * target + 1 {
                    third = i
                }
            }
        }

        let len = arr.count - third
        if first + len <= second && second + len <= third {
            for offset in 0..<len {
                if arr[first + offset] != arr[second + offset] || arr[first + offset] != arr[third + offset] {
                    return [-1, -1]
                }
            }
            return [first + len - 1, second + len]
        }

        return [-1, -1]
    }
}
