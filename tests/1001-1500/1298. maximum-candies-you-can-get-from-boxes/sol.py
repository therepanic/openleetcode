class Solution(object):
    def maxCandies(self, status, candies, keys, containedBoxes, initialBoxes):
        owned = set(initialBoxes)
        opened = set()
        changed = True
        totalCandies = 0
        while changed:
            changed = False
            for boxId in list(owned):
                if boxId in opened or not status[boxId]:
                    continue
                opened.add(boxId)
                changed = True
                totalCandies += candies[boxId]
                for keyId in keys[boxId]:
                    status[keyId] = 1
                owned.update(containedBoxes[boxId])
        return totalCandies
