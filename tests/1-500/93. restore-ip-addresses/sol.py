class Solution(object):
    def restoreIpAddresses(self, s):
        """
        :type s: str
        :rtype: List[str]
        """
        def backtrack(start, current):
            if len(current) == 4:
                if start == len(s):
                    result.append('.'.join(current))
                return

            for length in range(1, 4):
                if start + length <= len(s):
                    segment = s[start:start+length]
                    if self.is_valid(segment):
                        current.append(segment)
                        backtrack(start + length, current)
                        current.pop()

        result = []
        backtrack(0, [])
        return result

    def is_valid(self, segment):
        if len(segment) > 3 or (len(segment) > 1 and segment[0] == '0'):
            return False
        value = int(segment)
        return 0 <= value <= 255