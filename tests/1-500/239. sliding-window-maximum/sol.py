class Solution:
    def maxSlidingWindow(self, nums: List[int], k: int) -> List[int]:
        res = []
        q = deque()

        for idx, num in enumerate(nums):
            # Maintain the deque in descending order
            while q and q[-1] < num:
                q.pop()
            q.append(num)

            # Remove the elements which are out of this window
            if idx >= k and nums[idx - k] == q[0]:
                q.popleft()
            
            # Append the maximum of the current window to the result
            if idx >= k - 1:
                res.append(q[0])
        
        return res