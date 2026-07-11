# turns
MOUSE = 0
CAT = 1
# states
MOUSE_WIN = 1
CAT_WIN = 2
DRAW = 0


class Solution:
    def catMouseGame(self, graph: List[List[int]]) -> int:
        n = len(graph)

        # Initialize result map with terminal states (MOUSE_WIN/CAT_WIN)
        results = {}  # map (mouse_pos, cat_pos, turn) -> result
        for i in range(1, n):
            results[0, i, CAT] = results[0, i, MOUSE] = MOUSE_WIN
            results[i, i, CAT] = results[i, i, MOUSE] = CAT_WIN

        # Compute outdegree for all possible states
        degree = {}  # map (mouse_pos, cat_pos, turn) -> number of next states
        for mouse in range(1, n):
            for cat in range(1, n):
                degree[mouse, cat, MOUSE] = len(graph[mouse])
                degree[mouse, cat, CAT] = len(graph[cat]) - int(0 in graph[cat])

        # Initialize the queue with terminal states
        q = deque([state for state in results.keys()])
        # BFS
        while q:
            mouse, cat, turn = q.popleft()
            curResult = results[mouse, cat, turn]

            # Determine previous states based on the current turn
            prevStates = []
            if turn == MOUSE:
                prevStates = [(mouse, prevCat, CAT) for prevCat in graph[cat]]
            else:
                prevStates = [(prevMouse, cat, MOUSE) for prevMouse in graph[mouse]]

            # Update previous states based on the current state's result
            for prevState in prevStates:
                if prevState in results:
                    continue
                prevMouse, prevCat, prevTurn = prevState
                if prevCat == 0:  # impossible state
                    continue

                degree[prevState] -= 1
                isMoverWinner = (curResult == MOUSE_WIN and prevTurn == MOUSE) or (
                    curResult == CAT_WIN and prevTurn == CAT
                )
                if isMoverWinner or degree[prevState] == 0:
                    results[prevState] = curResult
                    q.append(prevState)

        return results.get((1, 2, MOUSE), DRAW)
