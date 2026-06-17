class Solution:
    def majorityElement(self, nums: List[int]) -> List[int]:
        majority1 = majority2 = count1 = count2 = 0

        for num in nums:
            if num == majority1:
                count1 += 1
            elif num == majority2:
                count2 += 1
            elif count1 == 0:
                majority1 = num
                count1 += 1
            elif count2 == 0:
                majority2 = num
                count2 += 1
            else:
                count1 -= 1
                count2 -= 1

        # Verify that majority1 and majority2 appear more than n/3 times.
        count1, count2 = 0, 0

        for num in nums:
            if num == majority1:
                count1 += 1
            elif num == majority2:
                count2 += 1

        res = []
        if count1 > len(nums) // 3:
            res.append(majority1)
        if count2 > len(nums) // 3:
            res.append(majority2)

        return res
