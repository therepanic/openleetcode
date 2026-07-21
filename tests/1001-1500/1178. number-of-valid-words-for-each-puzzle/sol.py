class Solution:
    def findNumOfValidWords(self, words: List[str], puzzles: List[str]) -> List[int]:
        words = [sorted(set(w)) for w in words]
        puzzles = [(p[0], set(p)) for p in puzzles]
        trees = [Trie() for _ in range(26)]
        for w in words:
            for char in w:
                trees[ord(char) - 97].insert(w)
        return [trees[ord(f) - 97].puzzle_match(p) for f, p in puzzles]


class Node(object):
    def __init__(self, val):
        self.val = val
        self.children = {}
        self.tail = 0


class Trie(object):
    def __init__(self):
        self.root = Node(None)

    def insert(self, word):
        curr = self.root
        for char in word:
            if char not in curr.children:
                curr.children[char] = Node(char)
            curr = curr.children[char]
        curr.tail += 1

    def puzzle_match(self, puzzle):
        def helper(node):
            nonlocal res
            res += node.tail
            for child in node.children:
                if child in puzzle:
                    helper(node.children[child])

        res = 0
        helper(self.root)
        return res
