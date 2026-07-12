class Solution:
    def splitArraySameAverage(self, nums: List[int]) -> bool:
        if len(nums) < 2:
            return False
        """
        step 1
        splitting the array into two parts with same average

        ------------------------------------- 
        

        sum(a)/x==sum(b)/x=k
        (sum(a)+sum(b))//2x
        (kx+kx)//2x -> k 


        so average of both the subarrays and overall subarray is equal 
        """
        k = sum(nums) / len(nums)
        total = sum(nums)
        nums = [(nums[i] * len(nums) - total) for i in range(len(nums))]
        print(nums)
        """
        step 3 
        now in this subarray find if it is possible to find a subsequence

        of size n//2 such that it's sum is equal to 0
        
        """

        """
        How will u iterate over a Fixed mask length But Bro Is it Required
        Yes we Cant we do 2^30 -> Do MIM  
        
        """

        def gen(arr):
            mp = defaultdict(set)
            for mask in range(1, 1 << len(arr)):
                total = 0
                for i in range(len(arr)):
                    if mask & (1 << i):
                        total += arr[i]
                mp[bin(mask).count("1")].add(total)
            return mp

        mid = (len(nums)) >> 1
        mp_a = gen(nums[:mid])
        mp_b = gen(nums[mid:])
        for val in mp_a:
            if 0 in mp_a[val] and val != 0:
                print(val)
                return True
        for val in mp_b:
            if 0 in mp_b[val] and val != 0:
                print(val)
                return True
        for length_a in mp_a:
            for length_b in mp_b:
                total_len = length_a + length_b
                if total_len == 0 or total_len == len(nums):
                    continue
                for val in mp_a[length_a]:
                    if -val in mp_b[length_b]:
                        return True
        return False
