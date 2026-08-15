class Solution:
    def smallestMissingValueSubtree(
        self, parents: List[int], nums: List[int]
    ) -> List[int]:
        n = len(parents)
        graph = defaultdict(list)
        node_one = None

        # Build the tree structure and find the root and node with genetic value 1
        for child, parent in enumerate(parents):
            if parent == -1:
                root = child  # Root node identified
            else:
                graph[parent].append(child)
            if nums[child] == 1:
                node_one = child  # Node with genetic value 1 found

        # Initialize results and seen values
        results = [1] * n
        if node_one is None:
            return results  # Return early if there is no node with genetic value 1

        seen = [False] * 100002  # Boolean array to track seen genetic values
        current_node = node_one
        previous_missing = 1

        # Traverse upwards from the node with genetic value 1
        while current_node != -1:
            self._markSeen(current_node, graph, seen, nums)
            # Find the first missing genetic value
            while previous_missing < 100002 and seen[previous_missing]:
                previous_missing += 1
            results[current_node] = previous_missing  # Assign the missing value
            current_node = parents[current_node]  # Move to the parent node

        return results

    def _markSeen(
        self, node: int, graph: defaultdict, seen: List[bool], nums: List[int]
    ):
        """DFS to mark genetic values seen in the subtree rooted at 'node'."""
        if not seen[nums[node]]:
            seen[nums[node]] = True  # Mark the current node's genetic value as seen
            for child in graph[node]:
                self._markSeen(child, graph, seen, nums)  # Recursively mark children
