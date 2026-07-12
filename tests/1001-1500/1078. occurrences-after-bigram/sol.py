class Solution:
    def findOcurrences(self, text: str, first: str, second: str) -> List[str]:
        text_list = text.split()
        result = []

        # Stop at len - 2 to avoid index out of range
        for i in range(len(text_list) - 2):
            # Check if the current word and the next word match 'first' and 'second'
            if text_list[i] == first and text_list[i + 1] == second:
                # If they match, add the word after 'second' to the result
                result.append(text_list[i + 2])

        return result
