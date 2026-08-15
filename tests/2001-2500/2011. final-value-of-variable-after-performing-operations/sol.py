class Solution(object):
    def finalValueAfterOperations(self, operations):
        return sum(1 if op[1] == "+" else -1 for op in operations)
