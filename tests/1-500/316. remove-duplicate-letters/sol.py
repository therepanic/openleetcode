class Solution:
    def removeDuplicateLetters(self, s: str) -> str:
        # Dictionary to store the last occurrence of each character
        last_occur = {}

        # Record the last occurrence of each character
        for i, char in enumerate(s):
            last_occur[char] = i        

        stack = []  # Stack to store characters in the desired order
        visited = set()  # Set to keep track of visited characters

        for i in range(len(s)):
            if s[i] in visited:
                continue  # Skip if the character is already visited

            # If the top of the stack is greater than s[i] and will occur later again, remove from stack
            while stack and s[i] < stack[-1] and i < last_occur.get(stack[-1], -1):
                visited.remove(stack.pop())

            visited.add(s[i])  # Mark as visited
            stack.append(s[i])  # Add to the stack
        
        return ''.join(stack)  # Concatenate the characters remaining in the stack