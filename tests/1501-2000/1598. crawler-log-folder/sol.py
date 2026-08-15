class Solution:
    def minOperations(self, logs: List[str]) -> int:
        output = 0
        for i in logs:
            if i == "../":
                output -= 1
                if output < 0:
                    output = 0
            elif i == "./":
                continue
            else:
                output += 1
        if output < 0:
            return 0
        else:
            return output
