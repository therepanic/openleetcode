class Solution:
    def longestAwesome(self, s: str) -> int:
        n = len(s)
        mask = {}
        cur_mask = 0b0000000000
        perfect_is_naaaaaa = 0b0000000000
        mask[cur_mask] = -1
        ans = 1
        for i in range(n):
            num = int(s[i])
            cur_mask ^= 1 << num
            need_mask = perfect_is_naaaaaa ^ cur_mask
            # all
            if need_mask in mask:
                ans = max(ans, i - mask[need_mask])
            # drop 1
            for bit in range(10):
                n_need_max = need_mask ^ (1 << bit)
                if n_need_max in mask:
                    ans = max(ans, i - mask[n_need_max])

            if cur_mask not in mask:
                mask[cur_mask] = i

        return ans
