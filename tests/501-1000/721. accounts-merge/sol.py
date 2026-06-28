from collections import defaultdict


class Solution(object):
    def accountsMerge(self, accounts):
        n = len(accounts)
        # Groups account indices by their associated account name
        location = defaultdict(set)
        # Holds the email sets for each corresponding account index
        content = []

        # Phase 1: Initialize collections and map names to indices
        for i in range(n):
            name = accounts[i][0]
            location[name].add(i)
            content.append(set(accounts[i][1:]))

        # Phase 2: Intersect and merge email buffers sharing a name group
        for name, indices in list(location.items()):
            for i in list(indices):
                for j in list(indices):
                    # If two distinct indices share an email, merge i into j
                    if i != j and not content[i].isdisjoint(content[j]):
                        content[j].update(content[i])
                        indices.discard(i)
                        location[name].discard(i)
                        break  # Step out to re-verify remaining sets with updated 'j'

        # Phase 3: Build the final sorted response array
        result = []
        for name, indices in location.items():
            for idx in indices:
                result.append([name] + sorted(list(content[idx])))

        return result
