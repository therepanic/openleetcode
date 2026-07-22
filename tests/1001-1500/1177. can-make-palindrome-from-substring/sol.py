class Solution:
    def canMakePaliQueries(self, s: str, queries: List[List[int]]) -> List[bool]:
        n = len(s)
        prefix = [0] * (n + 1)

        for i in range(n):
            bit = 1 << (ord(s[i]) - ord("a"))
            prefix[i + 1] = prefix[i] ^ bit

        res = []

        for left, right, ki in queries:
            mask = prefix[right + 1] ^ prefix[left]
            odd_count = bin(mask).count("1")

            if odd_count <= 1 or ki >= odd_count // 2:
                res.append(True)
            else:
                res.append(False)

        return res
