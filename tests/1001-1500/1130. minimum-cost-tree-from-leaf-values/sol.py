class Solution:
    def mctFromLeafValues(self, arr):
        result = 0
        st = [float("inf")]  # sentinel so stack is never empty

        for a in arr:
            while st[-1] <= a:
                mid = st.pop()
                result += mid * min(st[-1], a)
            st.append(a)

        # Merge remaining elements in stack
        first = st.pop()
        while len(st) > 1:  # leave sentinel
            result += first * st[-1]
            first = st.pop()

        return result
