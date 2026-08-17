class Solution:
    def numDifferentIntegers(self, word):
        i, n = 0, len(word)
        st = set()
        while i < n:
            while i < n and word[i].isalpha():
                i += 1
            tempInt = ""
            while i < n and word[i].isdigit():
                tempInt += word[i]
                i += 1
            j = 0
            while j + 1 < len(tempInt) and tempInt[j] == "0":
                j += 1
            k = tempInt[j:]
            if k != "":
                st.add(k)
        return len(st)
