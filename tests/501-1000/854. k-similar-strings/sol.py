import collections


class Solution:
    def kSimilarity(self, s1: str, s2: str) -> int:
        # the deque keeps track of the set of strings that we want to perform swaps on
        # at the start, the deque contains only s1
        deque = collections.deque([s1])

        # this set wasn't mentioned in the "intuition" part. it helps us avoid doing repeated work by adding the same strings to our deque
        seen = set()

        answ = 0  # counter for the number of "swaps" done so far

        while deque:
            for _ in range(len(deque)):  # loops through each string in the deque
                string = deque.popleft()  # gets the first string in the deque
                if string == s2:
                    return answ

                # finds the first non-matching letter in s1
                # this satisfies condition 1 of a "useful" swap
                # ex: this would be s1[3] in the above example
                i = 0
                while string[i] == s2[i]:
                    i += 1

                # checks all the other letters for potential swaps
                for j in range(i + 1, len(string)):
                    if (
                        string[i] == s2[j] != s1[j]
                    ):  # checks conditions 2 and 3 of a useful swap
                        # swaps the letters at positions i and j
                        new = (
                            string[:i]
                            + string[j]
                            + string[i + 1 : j]
                            + string[i]
                            + string[j + 1 :]
                        )

                        # adds the "new string" if it was not previously added
                        if new not in seen:
                            seen.add(new)
                            deque.append(new)

            # record that one more swap was done for each string in the deque
            answ += 1
