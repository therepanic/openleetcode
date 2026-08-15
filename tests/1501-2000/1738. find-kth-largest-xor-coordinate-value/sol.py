class Solution:
    def kthLargestValue(self, matrix: List[List[int]], k: int) -> int:
        grid = matrix
        n = len(grid)
        m = len(grid[0])
        # the value of the n is 1000 so we need to create a temp matrix in O(n^2) only

        # ---------------------------------------------------------------------------
        temp = [[0] * m for _ in range(n)]
        temp[0][0] = grid[0][0]
        # in XOR    0^a ====>>a   always #that is why intilalising temp with 0 BESt
        # ----------------------------------------------------------------------
        # -----------------------------------------
        # firstrow
        for j in range(1, m):
            temp[0][j] = temp[0][j - 1] ^ grid[0][j]

        # firstcolumn
        for i in range(1, n):
            temp[i][0] = temp[i - 1][0] ^ grid[i][0]

        # -----------------------------------------
        # filling temp
        for i in range(1, n):
            for j in range(1, m):
                temp[i][j] = (
                    grid[i][j] ^ temp[i - 1][j] ^ temp[i][j - 1] ^ temp[i - 1][j - 1]
                )
                #                                left          up                diag
        # ---------------------------------------------------------------------------------
        # print(f"{temp=}")

        # ---------------------------------------------------------------------
        arr = []
        for row in temp:
            arr.extend(row)
        # now either do the sorting thing in this array -->>> tc : O(n*n) *log(n*n)
        # or we can use heap upto k  i guess -->>> tc : O(n*n) *log(k)

        # firstly trying the sorting approach
        arr.sort(reverse=True)
        return arr[k - 1]  # k-1 becaue in prblm they said 1 indexig stupid
        # ---------------------------------------------------------------------

        # APPROACH 2  using a single pass for loop and heap simultaneously, pushing in the min heap
        # =====================================================================================================

        temp = [[0] * m for _ in range(n)]
        pq = []
        # -----------------------------------------------
        for i in range(n):
            for j in range(m):
                temp[i][j] = grid[i][j]

                if j > 0:  # firstrow
                    temp[i][j] ^= temp[i][j - 1]

                if i > 0:  # firstcolumn
                    temp[i][j] ^= temp[i - 1][j]

                if i > 0 and j > 0:  # inside elements
                    temp[i][j] ^= temp[i - 1][j - 1]  # diag

                # ---------------------------------------
                heapq.heappush(pq, temp[i][j])
                while len(pq) > k:
                    heapq.heappop(pq)
                # ---------------------------------------

        return pq[0]
        # ---------------------------------------------------------------------------------

        # Using MinHeap works here.


# =====================================================================================================
