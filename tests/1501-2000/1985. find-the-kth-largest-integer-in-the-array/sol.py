class Solution:
    def kthLargestNumber(self, nums: List[str], k: int) -> str:
        arr = list(map(int, nums))
        arr.sort(reverse=True)
        return str(arr[k - 1])
