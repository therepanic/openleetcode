class Solution(object):
    def exist(self, board, word):
        rows = len(board)
        cols = len(board[0])
        
        def dfs(r, c, index):
            # If we've matched every letter in the word, we win!
            if index == len(word):
                return True
            
            # Stay within grid boundaries and make sure the letter matches
            if (r < 0 or r >= rows or c < 0 or c >= cols or 
                board[r][c] != word[index]):
                return False
            
            # Temporary "mark" the cell so we don't use it again in this path
            temp = board[r][c]
            board[r][c] = "#"
            
            # Try moving in all 4 directions to find the next letter
            found = (dfs(r + 1, c, index + 1) or 
                     dfs(r - 1, c, index + 1) or 
                     dfs(r, c + 1, index + 1) or 
                     dfs(r, c - 1, index + 1))
            
            # "Unmark" the cell (Backtrack) for other potential searches
            board[r][c] = temp
            return found

        # Kick off the search from every cell that matches the first letter
        for r in range(rows):
            for c in range(cols):
                if board[r][c] == word[0]:
                    if dfs(r, c, 0):
                        return True
                        
        return False