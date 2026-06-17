class Solution:
    def addOperators(self, num: str, target: int) -> List[str]:
        n = len(num)

        def solve(idx, path, curr, prev):
            if idx == n:
                if curr == target:
                    res.append(path)
                return
            for i in range(idx, n):
                if i > idx and num[idx] == "0":
                    break
                str = num[idx : i + 1]
                val = int(str)
                if idx == 0:
                    solve(i + 1, str, val, val)
                else:
                    solve(i + 1, path + "+" + str, curr + val, val)
                    solve(i + 1, path + "-" + str, curr - val, -val)
                    solve(
                        i + 1,
                        path + "*" + str,
                        (curr - prev) + (prev * val),
                        prev * val,
                    )

        res = []
        solve(0, "", 0, 0)
        return res
