class Solution(object):
    def addNegabinary(self, arr1, arr2):
        """
        :type arr1: List[int]
        :type arr2: List[int]
        :rtype: List[int]
        """
        res = []
        carry = 0
        while carry or arr1 or arr2:
            if arr1:
                carry += arr1.pop()
            if arr2:
                carry += arr2.pop()
            res.append(carry & 1)
            carry = -(carry >> 1)
        
        while len(res) > 1 and res[-1] == 0:
            res.pop()
        return res[::-1]
