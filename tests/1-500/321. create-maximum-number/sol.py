class Solution:
    def maxNumber(self, nums1: List[int], nums2: List[int], k: int) -> List[int]:
        
        def getDeq(nums: List[int], q: int) -> Deque[int]:
            stack = []
            if q > 0:
                max_drop = len(nums) - q
                for num in nums:
                    while max_drop > 0 and stack and stack[-1] < num:
                        stack.pop()
                        max_drop -= 1
                    stack.append(num)
            return deque(stack[:q])

        def merge(a: Deque[int], b: Deque[int]) -> List[int]:
            output = []
            while a or b:
                if a > b:
                    output.append(a.popleft())
                else:
                    output.append(b.popleft())
            return output
            

        ans = []
        m, n = len(nums1), len(nums2)
        start, end = max(0, k - n), min(m, k)
        for i in range(start, end + 1):
            dq1, dq2 = getDeq(nums1, i), getDeq(nums2, k - i)
            ans = max(ans, merge(dq1, dq2))

        return ans