# https://leetcode.com/problems/partition-array-into-two-arrays-to-minimize-sum-difference/
class Solution:
    def minimumDifference(self, arr) -> int:
        """
We need to divide the 2n elements into two groups containing exactly n
elements each such that the absolute difference between their sums is
as small as possible

Let the sum of one chosen group be S and the total sum of the array be T

The other group's sum is T - S

The required difference is

|S - (T - S)| = |2S - T|

Therefore, instead of directly thinking about two partitions, the problem
becomes choosing exactly n elements whose sum is as close as possible to
T / 2

Trying all combinations of n elements takes O(C(2n, n)), which is too
expensive

Since the array length is at most 30, split it into two halves of size n

For each half, generate all subset sums and group them by the number of
elements chosen

mp[k] stores all possible sums obtained by selecting exactly k elements
from that half

Suppose we choose k elements from the right half

Then we must choose n - k elements from the left half so that the total
number of selected elements is exactly n

For every sum from the right half, find a compatible sum from the left
half such that their combined sum is as close as possible to T / 2

The left sums are sorted, so binary search can be used to find the
closest candidates efficiently

For each right sum, only the two neighbors around the insertion position
need to be checked because one of them gives the minimum difference

Update the answer using

|T - 2 * (left_sum + right_sum)|

This meet-in-the-middle approach reduces the complexity from exponential
in 2n to roughly O(n * 2^n), which is efficient for n ≤ 15
"""
        n=len(arr)

        def gen(arr):
            max_len=len(arr)
            mp=defaultdict(list)
            for mask in range(1<<max_len):
                total=0
                bit_count=bin(mask)[2:].count('1')
                for i in range(max_len):
                    if mask & (1<<i):
                        total+=arr[i]
                mp[bit_count].append(total)
            return mp
        mid=(len(arr))>>1
        mp_left=gen(arr[:mid])
        mp_right=gen(arr[mid:])
        for k in mp_left:
            mp_left[k].sort()
        for k in mp_right:
            mp_right[k].sort()
        # print(mp_left)
        # print(mp_right)
        ans=float('inf')
        total=sum(arr)
        for val in mp_right:
            #we have one of size val 
            #other one size is n-val
            left_sz=len(arr)//2-val
            #to minimise a-b = 0 -> a+b=s 
            #2a=x+s -> a=(x+s)/2 
            #2s-2b=x+s
            #x=s-2b 
            for value in mp_right[val]:
                idx=bisect.bisect_left(mp_left[left_sz],total//2-value)
                ans=min(ans,abs(total-2*((mp_left[left_sz][idx-1] +value) if idx>0 else float('inf'))),abs(total-2*((mp_left[left_sz][idx]+value if idx<len(mp_left[left_sz]) else float('inf')))))
        return ans