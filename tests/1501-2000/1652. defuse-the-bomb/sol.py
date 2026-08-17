class Solution:
    def decrypt(self, code: List[int], k: int) -> List[int]:
        n = len(code)
        result = [0] * n

        if k == 0:
            return result

        window = abs(k)
        total = 0

        start = 1 if k > 0 else n - window
        end = window if k > 0 else n - 1

        for i in range(start, end + 1):
            total += code[i % n]
        for i in range(n):
            result[i] = total

            total -= code[start % n]
            start += 1

            end += 1
            total += code[end % n]
        return result
