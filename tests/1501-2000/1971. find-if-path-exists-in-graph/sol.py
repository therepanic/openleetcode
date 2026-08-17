from collections import deque
from typing import List


class Graph:
    def __init__(self, directed=False):
        self.adj_list = {}
        self.directed = directed

    def add_node(self, node):
        if node not in self.adj_list:
            self.adj_list[node] = set()

    def add_edge(self, node1, node2):
        self.add_node(node1)
        self.add_node(node2)
        self.adj_list[node1].add(node2)
        if not self.directed:
            self.adj_list[node2].add(node1)

    def DFS(self, current_node, target_node, visited=None) -> bool:
        if visited is None:
            visited = set()
        if current_node == target_node:
            return True
        if current_node in visited:
            return False
        visited.add(current_node)
        for neighbor in self.adj_list.get(current_node, []):
            if self.DFS(neighbor, target_node, visited):
                return True
        return False

    def BFS(self, current_node, target_node):
        if current_node == target_node:
            return True
        queue = deque([current_node])
        visited = {current_node}
        while queue:
            current = queue.popleft()
            for neighbor in self.adj_list.get(current, []):
                if neighbor == target_node:
                    return True
                if neighbor not in visited:
                    visited.add(neighbor)
                    queue.append(neighbor)
        return False


class Solution:
    def validPath(
        self, n: int, edges: List[List[int]], source: int, destination: int
    ) -> bool:
        if source == destination:
            return True
        graph1 = Graph()
        for i in edges:
            graph1.add_edge(i[0], i[1])
        return graph1.BFS(current_node=source, target_node=destination)
