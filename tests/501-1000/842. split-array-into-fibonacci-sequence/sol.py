class Solution:
    def splitIntoFibonacci(self, num: str) -> List[int]:
        def invalid(
            x,
        ):  # check if x has leading zeroes and is invalied or overflows (x > 2^31)
            return x[0] == "0" and len(x) > 1 or int(x) >= (1 << 31)

        def check(a0, a1, num):
            i = 0
            ret = [int(a0), int(a1)]

            while i < len(num):
                a0 = int(a0)
                a1 = int(a1)

                res = str(a0 + a1)
                j = 0

                while i < len(num) and j < len(res) and res[j] == num[i]:
                    j, i = j + 1, i + 1
                if j < len(res) or invalid(res):
                    return []

                a0, a1 = a1, res

                ret.append(int(res))

            return ret

        n = len(num)

        for j in range(1, n - 1):
            for i in range(0, j):
                a0 = num[: i + 1]
                a1 = num[i + 1 : j + 1]

                if invalid(a0) or invalid(a1):
                    continue

                ret = check(a0, a1, num[j + 1 :])
                if ret:
                    return ret

        return []
