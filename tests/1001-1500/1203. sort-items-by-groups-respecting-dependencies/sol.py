from collections import defaultdict, deque


class Solution:
    def sortItems(
        self, n: int, m: int, group: List[int], beforeItems: List[List[int]]
    ) -> List[int]:

        def topologicalSort(nodes, pred, succ):
            order, no_pred = [], deque(node for node in nodes if not pred[node])
            while no_pred:
                node = no_pred.popleft()
                order.append(node)
                for s in succ[node]:
                    pred[s].discard(node)
                    if not pred[s]:
                        no_pred.append(s)
            return order if len(order) == len(nodes) else []

        group_to_items, new_group = defaultdict(set), m
        for item in range(n):
            if group[item] == -1:
                group[item] = new_group
                new_group += 1
            group_to_items[group[item]].add(item)

        intra_pred, intra_succ, inter_pred, inter_succ = (
            defaultdict(set),
            defaultdict(set),
            defaultdict(set),
            defaultdict(set),
        )
        for item in range(n):
            for before in beforeItems[item]:
                if group[item] == group[before]:
                    intra_pred[item].add(before)
                    intra_succ[before].add(item)
                else:
                    inter_pred[group[item]].add(group[before])
                    inter_succ[group[before]].add(group[item])

        groups_order = topologicalSort(
            list(group_to_items.keys()), inter_pred, inter_succ
        )
        if not groups_order:
            return []

        items_order = []
        for grp in groups_order:
            order = topologicalSort(group_to_items[grp], intra_pred, intra_succ)
            if not order:
                return []
            items_order.extend(order)

        return items_order
