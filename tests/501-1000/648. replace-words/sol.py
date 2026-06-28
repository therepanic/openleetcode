class Solution:
    def add_in_trie(self, trie, word):
        n = trie

        for letter in word:
            if letter not in n:
                n[letter] = {"*": False}

            n = n[letter]

        n["*"] = True

    def get_replacement(self, trie, word):
        n = trie

        for i in range(len(word)):
            if n["*"]:
                return word[0:i]
            if word[i] not in n:
                break

            n = n[word[i]]

        return word

    def replaceWords(self, dictionary: List[str], sentence: str) -> str:
        trie = {"*": False}
        arr = sentence.split(" ")

        for word in dictionary:
            self.add_in_trie(trie, word)

        for i in range(len(arr)):
            arr[i] = self.get_replacement(trie, arr[i])

        return " ".join(arr)
