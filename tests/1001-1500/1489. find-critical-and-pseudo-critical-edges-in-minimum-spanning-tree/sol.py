class UnionFind:
    # Constructor to initialize the UnionFind (Disjoint Set) structure
    def __init__(self, n):
        # Initialize each node to be its own parent (self-loop)
        self.parent = list(range(n))

    # Method to find the root (parent) of a node with path compression
    def find_parent(self, p):
        # If the node is its own parent, return it
        if self.parent[p] == p:
            return p
        # Path compression: make the parent of p the root of the set
        self.parent[p] = self.find_parent(self.parent[p])
        return self.parent[p]

    # Method to unify two nodes by connecting their sets
    def union(self, u, v):
        # Find the root of u and the root of v
        pu, pv = self.find_parent(u), self.find_parent(v)
        # Merge the two sets by making one root the parent of the other
        self.parent[pu] = pv


class Solution:
    # A static method to compare two edges based on their weights (used in sorting)
    @staticmethod
    def cmp(a, b):
        return a[2] < b[2]  # Compare based on the weight (third element of the edge)

    # Method to find critical and pseudo-critical edges in the Minimum Spanning Tree (MST)
    def findCriticalAndPseudoCriticalEdges(self, n, edges):
        critical = []  # List to store critical edges
        pseudo_critical = []  # List to store pseudo-critical edges

        # Add an index to each edge to track its original position
        for i in range(len(edges)):
            edges[i].append(i)

        # Sort the edges based on their weights
        edges.sort(key=lambda x: x[2])

        # Find the total weight of the Minimum Spanning Tree (MST) without any exclusions
        mstwt = self.find_MST(n, edges, -1, -1)

        # Iterate over all edges to find critical and pseudo-critical ones
        for i in range(len(edges)):
            # Check if excluding this edge increases the MST weight (i.e., it's critical)
            if mstwt < self.find_MST(n, edges, i, -1):
                critical.append(edges[i][3])  # Append the index of the critical edge
            # Check if including this edge keeps the MST weight the same (i.e., it's pseudo-critical)
            elif mstwt == self.find_MST(n, edges, -1, i):
                pseudo_critical.append(
                    edges[i][3]
                )  # Append the index of the pseudo-critical edge

        # Return the list of critical and pseudo-critical edges
        return [critical, pseudo_critical]

    # Helper method to find the weight of the MST
    # 'block' is the edge to exclude, 'e' is the edge to force include
    def find_MST(self, n, edges, block, e):
        uf = UnionFind(n)  # Initialize the UnionFind structure for 'n' nodes
        weight = 0  # Initialize the total weight of the MST

        # If 'e' is not -1, include that edge first
        if e != -1:
            weight += edges[e][2]  # Add the weight of the edge 'e'
            uf.union(edges[e][0], edges[e][1])  # Union the nodes of edge 'e'

        # Iterate through all edges to build the MST
        for i in range(len(edges)):
            # Skip the blocked edge
            if i == block:
                continue
            # If the edge forms a cycle, skip it
            if uf.find_parent(edges[i][0]) == uf.find_parent(edges[i][1]):
                continue
            # Otherwise, union the nodes and add the edge weight to the total
            uf.union(edges[i][0], edges[i][1])
            weight += edges[i][2]

        # Check if all nodes are connected (i.e., the graph forms a spanning tree)
        for i in range(n):
            if uf.find_parent(i) != uf.find_parent(0):
                return float("inf")  # If not all nodes are connected, return infinity

        # Return the total weight of the MST
        return weight
