class Solution:
    def robotSim(self, commands, obstacles):
        # Store obstacles
        blocked = set()
        for o in obstacles:
            blocked.add((o[0], o[1]))

        # Directions: North, East, South, West
        directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]

        x, y = 0, 0
        dir = 0  # initially facing North
        maxDist = 0

        for cmd in commands:
            if cmd == -1:
                dir = (dir + 1) % 4  # turn right
            elif cmd == -2:
                dir = (dir + 3) % 4  # turn left
            else:
                while cmd > 0:
                    nx = x + directions[dir][0]
                    ny = y + directions[dir][1]

                    # check obstacle
                    if (nx, ny) in blocked:
                        break

                    x = nx
                    y = ny

                    maxDist = max(maxDist, x * x + y * y)
                    cmd -= 1

        return maxDist
