class Solution:
    def interpret(self, command):

        result = []
        i = 0

        while i < len(command):
            if command[i] == "G":
                result.append("G")
                i += 1

            elif command[i : i + 2] == "()":
                result.append("o")
                i += 2

            else:
                result.append("al")
                i += 4

        return "".join(result)
