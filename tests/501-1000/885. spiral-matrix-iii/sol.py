class Solution:
    def spiralMatrixIII(
        self, rows: int, cols: int, rStart: int, cStart: int
    ) -> List[List[int]]:
        res = []

        top = bottom = rStart
        left = right = cStart

        res.append([rStart, cStart])

        while len(res) < rows * cols:
            # top row
            right += 1
            for i in range(left + 1, right + 1):
                if 0 <= top < rows and 0 <= i < cols:
                    res.append([top, i])
                    if len(res) == rows * cols:
                        return res

            # right row
            bottom += 1
            for i in range(top + 1, bottom + 1):
                if 0 <= right < cols and 0 <= i < rows:
                    res.append([i, right])
                    if len(res) == rows * cols:
                        return res

            # bottom row
            left -= 1
            for i in range(right - 1, left - 1, -1):
                if 0 <= i < cols and 0 <= bottom < rows:
                    res.append([bottom, i])
                    if len(res) == rows * cols:
                        return res

            # left row
            top -= 1
            for i in range(bottom - 1, top - 1, -1):
                if 0 <= i < rows and 0 <= left < cols:
                    res.append([i, left])
                    if len(res) == rows * cols:
                        return res

        return res
