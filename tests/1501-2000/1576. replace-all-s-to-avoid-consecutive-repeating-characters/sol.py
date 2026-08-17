class Solution:
    def modifyString(self, s: str) -> str:
        s = list(s)
        n = len(s)

        for i in range(n):
            if s[i] == "?":
                left = s[i - 1] if i > 0 else " "
                right = s[i + 1] if i + 1 < n else " "

                if left != "a" and right != "a":
                    s[i] = "a"
                elif left != "b" and right != "b":
                    s[i] = "b"
                else:
                    s[i] = "c"

        return "".join(s)
