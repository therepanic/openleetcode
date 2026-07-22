class Solution {
    func largestMultipleOfThree(_ digits: [Int]) -> String {
        var counts = [Int](repeating: 0, count: 10)
        for digit in digits {
            counts[digit] += 1
        }

        var sum = 0
        for i in 0..<10 {
            sum += i * counts[i]
        }
        let remainder = sum % 3

        func removeSmallest(_ group: [Int], _ amount: Int) -> Bool {
            var amt = amount
            for digit in group {
                while amt > 0 && counts[digit] > 0 {
                    counts[digit] -= 1
                    amt -= 1
                }
            }
            return amt == 0
        }

        if remainder == 1 {
            if !removeSmallest([1, 4, 7], 1) {
                removeSmallest([2, 5, 8], 2)
            }
        } else if remainder == 2 {
            if !removeSmallest([2, 5, 8], 1) {
                removeSmallest([1, 4, 7], 2)
            }
        }

        var result = ""
        for i in stride(from: 9, through: 0, by: -1) {
            result += String(repeating: String(i), count: counts[i])
        }
        return result.hasPrefix("0") ? "0" : result
    }
}
