func racecar(target int) int {
    type state struct{ pos, speed, moves int }
    q := []state{{0, 1, 0}}
    for len(q) > 0 {
        cur := q[0]
        q = q[1:]
        if cur.pos == target {
            return cur.moves
        }
        q = append(q, state{cur.pos + cur.speed, cur.speed * 2, cur.moves + 1})
        if (cur.pos+cur.speed > target && cur.speed > 0) || (cur.pos+cur.speed < target && cur.speed < 0) {
            if cur.speed < 0 {
                q = append(q, state{cur.pos, 1, cur.moves + 1})
            } else {
                q = append(q, state{cur.pos, -1, cur.moves + 1})
            }
        }
    }
    return -1
}
