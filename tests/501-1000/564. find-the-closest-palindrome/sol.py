class Solution:
    def nearestPalindromic(self, n: str) -> str:
        N = len(n)

        def convert(num):
            # 0 1 2 3 4
            n = len(str(num))
            num = list(str(num))
            l = 0
            r = n - 1
            while l <= r:
                num[r] = num[l]
                r -= 1
                l += 1
            return int("".join(num))

        def prev_pal(num):
            low = 0
            high = int(1e19)
            ans = -1
            while low <= high:
                mid = (low + high) >> 1
                val = convert(mid)
                if val >= num:
                    high = mid - 1
                else:
                    low = mid + 1
                    ans = val
            return ans

        def next_pal(num):
            low = 0
            high = int(1e19)
            ans = -1
            while low <= high:
                mid = (low + high) >> 1
                val = convert(mid)
                if val <= num:
                    low = mid + 1
                else:
                    ans = val
                    high = mid - 1
            return ans

        n = int(n)
        v1 = prev_pal(n)
        v2 = next_pal(n)
        # print(v1,v2)
        if abs(v1 - n) > abs(v2 - n):
            return str(v2)
        else:
            return str(v1)
