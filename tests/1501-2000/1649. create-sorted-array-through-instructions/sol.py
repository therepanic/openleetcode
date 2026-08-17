class Solution:
    def createSortedArray(self, instructions: List[int]) -> int:
        nums = instructions
        # ans stores the ind : [min , max] for each ind in nums
        ans = {i: [0, 0] for i in range(len(nums))}

        def merge(left, right):
            # Note that we are only concerned about finding numbers strictly greater that and...
            # ...numbers strictly less that, for the numbers in the right list if we insert them in the left list
            # Note that this can be done using Bisection also, but this is for the pure merge sort lovers :)

            # NOW
            # starting from the end left and right we can find the numbers ...
            # ...strictly greater than the numbers on the right if we find the first number
            # ... less that or equal to it on numbers in the left list
            l = len(left) - 1
            r = len(right) - 1
            while l > -1 and r > -1:
                if nums[left[l]] <= nums[right[r]]:
                    ans[right[r]][1] += (len(left) - 1) - l
                    r -= 1
                else:
                    l -= 1

            # if the right pointer is not out of bound this means it is greater that all the numbers on the left list
            while r > -1:
                ans[right[r]][1] += len(left)
                r -= 1

            # now while merging we can find numbers strictly less than the numbers in the right list
            # ...if we find a number on the left list greater that or equal to it while we iterate from start to end on both

            l = 0
            r = 0
            res = []
            while l < len(left) and r < len(right):
                # since the left and right lists hold indexes nums[ ... ] they go in here
                if nums[left[l]] < nums[right[r]]:
                    res.append(left[l])
                    l += 1
                else:
                    ans[right[r]][0] += l
                    res.append(right[r])
                    r += 1

            # if the right pointer is not out of bound it means all the numbers on the left are less that what its holding...
            # ...and same for the elements that come after it.
            while r < len(right):
                ans[right[r]][0] += l
                res.append(right[r])
                r += 1

            res.extend(left[l:])
            return res

        def split(l, r, arr):
            if l == r:
                return [arr[r]]

            mid = (l + r) // 2

            left = split(l, mid, arr)
            right = split(mid + 1, r, arr)

            return merge(left, right)

        # It is better to give the mergesort the indexes and also use the indexes for the dictionary
        # ... to account for repeated numbers!!
        split(0, len(nums) - 1, [i for i in range(len(nums))])

        # take only the mean for the real answer
        real_ans = 0
        for i in ans.keys():
            real_ans += min(ans[i])

        return real_ans % ((10**9) + 7)
