class Solution:
    def minStickers(self, stickers: List[str], target: str) -> int:
        result = self.dfs(stickers, target, 0, {})
        return result if result != float("inf") else -1

    def dfs(self, stickers, target, idx, memo):
        # if target is empty then we don't need to take any sticker
        if target == "":
            return 0
        # if we've searched through all stickers and haven't completed the target
        # then there is no solution
        if idx == len(stickers):
            return float("inf")

        # lookup the answer in the cache
        key = (idx, target)
        if key in memo:
            return memo[key]

        # choice 1 don't take the current sticker
        result = self.dfs(stickers, target, idx + 1, memo)

        # choice 2 try to take the current sticker
        currentSticker = stickers[idx]
        newTarget = target
        somethingRemoved = False
        for c in currentSticker:
            idxToRemove = newTarget.find(c)
            if idxToRemove != -1:
                newTarget = newTarget[:idxToRemove] + newTarget[idxToRemove + 1 :]
                somethingRemoved = True

        # only try this sticker again if we were able to remove something from
        # the target string
        if somethingRemoved:
            result = min(result, 1 + self.dfs(stickers, newTarget, idx, memo))

        # cache the result
        memo[key] = result
        return result
