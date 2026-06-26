import re


class Solution:
    def isValid(self, code: str) -> bool:
        tag_pat = r"<(/?)([A-Z]{1,9})>"
        open_cdata = "<![CDATA["
        close_cdata = "]]>"
        stack = []
        first_tag_seen = False
        i, j = 0, len(code)

        while i <= j:
            s = code.find("<", i)
            if s == -1:
                break
            e = code.find(">", s + 1)
            if e == -1:
                return False

            candidate = code[s : e + 1]
            m = re.fullmatch(tag_pat, candidate)

            if m:
                tag = m.groups()[1]

                # Opening tag
                if m.groups()[0] == "":
                    if not first_tag_seen and s != 0:
                        return False
                    stack.append(tag)
                    first_tag_seen = True

                # Closing tag
                else:
                    if not stack or stack[-1] != tag:
                        return False
                    if len(stack) == 1 and e != len(code) - 1:
                        return False
                    stack.pop()

                i = e + 1

            # CDATA Section
            elif code.startswith(open_cdata, s):
                k = code.find(close_cdata, s + len(open_cdata))
                if k == -1:
                    return False
                i = k + len(close_cdata)

            else:
                return False

        return not stack and first_tag_seen
