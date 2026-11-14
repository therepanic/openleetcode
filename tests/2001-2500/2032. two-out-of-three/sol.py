class Solution(object):
    def twoOutOfThree(self, nums1, nums2, nums3):
        l=set(nums1+nums2+ nums3)
        l1=[]
        for i in l:
            if i in nums1 and i in nums2 or i in nums1 and i in nums3 or i in nums2 and i in nums3 :
                if i not in l1:
                    l1.append(i)
        return l1