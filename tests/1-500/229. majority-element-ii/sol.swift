class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        var majority1 = 0, majority2 = 0, count1 = 0, count2 = 0

        for num in nums {
            if num == majority1 {
                count1 += 1
            } else if num == majority2 {
                count2 += 1
            } else if count1 == 0 {
                majority1 = num
                count1 = 1
            } else if count2 == 0 {
                majority2 = num
                count2 = 1
            } else {
                count1 -= 1
                count2 -= 1
            }
        }

        count1 = 0
        count2 = 0

        for num in nums {
            if num == majority1 {
                count1 += 1
            } else if num == majority2 {
                count2 += 1
            }
        }

        var res: [Int] = []
        if count1 > nums.count / 3 {
            res.append(majority1)
        }
        if count2 > nums.count / 3 {
            res.append(majority2)
        }

        return res
    }
}
