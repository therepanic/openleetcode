class Solution:
    def findLadders(
        self, beginWord: str, endWord: str, wordList: List[str]
    ) -> List[List[str]]:
        depthMap = {}
        ans = []

        def dfs(word, seq):
            if word == beginWord:
                ans.append(seq[::-1])
                return

            steps = depthMap[word]
            for i in range(len(word)):
                original = word[i]
                for ch in "abcdefghijklmnopqrstuvwxyz":
                    word = word[:i] + ch + word[i + 1 :]
                    if word in depthMap and depthMap[word] + 1 == steps:
                        seq.append(word)
                        dfs(word, seq)
                        seq.pop()
                word = word[:i] + original + word[i + 1 :]

        wordSet = set(wordList)
        q = deque([beginWord])
        depthMap[beginWord] = 1
        wordSet.discard(beginWord)

        while q:
            word = q.popleft()
            steps = depthMap[word]
            if word == endWord:
                break
            for i in range(len(word)):
                original = word[i]
                for ch in "abcdefghijklmnopqrstuvwxyz":
                    word = word[:i] + ch + word[i + 1 :]
                    if word in wordSet:
                        q.append(word)
                        wordSet.discard(word)
                        depthMap[word] = steps + 1
                word = word[:i] + original + word[i + 1 :]

        if endWord in depthMap:
            seq = [endWord]
            dfs(endWord, seq)

        return ans

        # queue = deque([[beginWord]])
        # wordSet = set(wordList)
        # visited = set()
        # res = []
        # patterns = defaultdict(list)
        # for word in wordList:
        #     for i in range(len(word)):
        #         curPattern = word[:i] + "*" + word[i + 1:]
        #         patterns[curPattern].append(word)
        # while queue:
        #     currLayer = set()
        #     for _ in range(len(queue)):
        #         curList = queue.popleft()
        #         lastWord = curList[-1]
        #         if lastWord == endWord:
        #             res.append(curList)
        #         for i in range(len(lastWord)):
        #             newWord = lastWord[:i] + "*" + lastWord[i + 1:]
        #             for pattern in patterns[newWord]:
        #                 if pattern in wordSet and pattern not in visited:
        #                     queue.append(curList + [pattern])
        #                     currLayer.add(pattern)
        #     visited.update(currLayer)

        # return res

        # if endWord not in wordList:
        #     return []

        # def bfs(beginWord, endWord, patterns):
        #     graph = defaultdict(set)
        #     queue = deque([beginWord])
        #     visited = set([beginWord])
        #     found = False
        #     localVisited = set()

        #     while queue and not found:
        #         for _ in range(len(queue)):
        #             word = queue.popleft()
        #             for i in range(len(word)):
        #                 curPattern = word[:i] + "A*" + word[i + 1:]
        #                 for neighbor in patterns[curPattern]:
        #                     if neighbor == endWord:
        #                         found = True
        #                     if neighbor not in visited:
        #                         localVisited.add(neighbor)
        #                         queue.append(neighbor)
        #                         graph[word].add(neighbor)
        #         visited.update(localVisited)
        #     return graph if found else None

        # def dfs(word, endWord, graph, path, res):
        #     path.append(word)
        #     if word == endWord:
        #         res.append(list(path))
        #     else:
        #         for neighbor in graph[word]:
        #             dfs(neighbor, endWord, graph, path, res)
        #     path.pop()

        # graph = bfs(beginWord, endWord, patterns)
        # if not graph:
        #     return []

        # res = []
        # dfs(beginWord, endWord, graph, [], res)
        # return res
