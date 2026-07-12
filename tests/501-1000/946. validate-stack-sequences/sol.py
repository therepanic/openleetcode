class Solution:
    def validateStackSequences(self, pushed, popped):
        st = []
        j = 0
        for x in pushed:
            st.append(x)
            while st and j < len(popped) and st[-1] == popped[j]:
                st.pop()
                j += 1
        return j == len(popped)
