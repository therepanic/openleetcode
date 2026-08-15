class Solution {
    func canChoose(_ groups: [[Int]], _ nums: [Int]) -> Bool {
        var i = 0
        for group in groups {
            var found = false
            while i + group.count <= nums.count {
                var match = true
                for j in 0..<group.count {
                    if nums[i + j] != group[j] {
                        match = false
                        break
                    }
                }
                if match {
                    i += group.count
                    found = true
                    break
                } else {
                    i += 1
                }
            }
            if !found {
                return false
            }
        }
        return true
    }
}
