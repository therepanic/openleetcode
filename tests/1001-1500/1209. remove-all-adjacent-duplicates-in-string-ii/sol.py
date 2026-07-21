class Solution:
    def removeDuplicates(self, s: str, k: int) -> str:
        stack = []  # holds [char, count] pairs

        for char in s:
            if stack and stack[-1][0] == char:
                stack[-1][1] += 1  # extend current run
            else:
                stack.append([char, 1])  # start new run

            if stack[-1][1] == k:  # run complete — remove it
                stack.pop()

        return "".join(char * count for char, count in stack)
