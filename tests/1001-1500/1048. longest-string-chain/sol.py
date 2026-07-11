class Solution:
    def longestStrChain(self, words: List[str]) -> int:
        chains = {}  # Stores the max chain length for each word
        sorted_words = sorted(words, key=len)  # Sort words by length

        for word in sorted_words:
            chains[word] = 1  # Initialize the chain length for the current word

            for i in range(len(word)):
                # word = abc, i = 0, word[:i] = "" + word[i+1:] = "bc" = "bc"
                # word = abc, i = 1, word[:i] = "a" + word[i+1:] = "c" = "ac"
                # word = abc, i = 2, word[:i] = "ab" + word[i+1:] = "" = "ab"
                pred = (
                    word[:i] + word[i + 1 :]
                )  # Generate predecessor by removing one character
                if pred in chains:
                    chains[word] = max(chains[word], chains[pred] + 1)

        return max(chains.values())
