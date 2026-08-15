def comb(n, r):
    r = min(r, n - r)
    result = 1
    for i in range(1, r + 1):
        result = result * (n - r + i) // i
    return result


class Solution:
    def kthSmallestPath(self, destination, k):
        rows, cols = destination
        path = []
        k -= 1  # Convert k to 0-indexed

        while rows > 0 or cols > 0:
            # Number of paths starting with 'H'
            if cols > 0:
                paths_with_H = comb(rows + cols - 1, cols - 1)
            else:
                paths_with_H = 0

            if k < paths_with_H:
                path.append("H")
                cols -= 1
            else:
                path.append("V")
                k -= paths_with_H
                rows -= 1

        return "".join(path)
