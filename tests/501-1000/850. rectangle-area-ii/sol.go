func rectangleArea(rectangles [][]int) int {
    const MOD = 1000000007
    const OPEN = 0
    const CLOSE = 1
    
    type Event struct {
        y, typ, x1, x2 int
    }
    
    var events []Event
    for _, r := range rectangles {
        x1, y1, x2, y2 := r[0], r[1], r[2], r[3]
        events = append(events, Event{y1, OPEN, x1, x2})
        events = append(events, Event{y2, CLOSE, x1, x2})
    }
    sort.Slice(events, func(i, j int) bool {
        return events[i].y < events[j].y
    })
    
    res := 0
    curY := events[0].y
    type Segment struct{ x1, x2 int }
    var active []Segment
    
    for _, e := range events {
        y, typ, x1, x2 := e.y, e.typ, e.x1, e.x2
        
        q := 0
        cur := -1
        sort.Slice(active, func(i, j int) bool {
            return active[i].x1 < active[j].x1
        })
        for _, seg := range active {
            if seg.x2 > cur {
                if seg.x1 > cur {
                    q += seg.x2 - seg.x1
                } else {
                    q += seg.x2 - cur
                }
                if seg.x2 > cur {
                    cur = seg.x2
                }
            }
        }
        
        res = (res + q*(y-curY)) % MOD
        curY = y
        
        if typ == OPEN {
            active = append(active, Segment{x1, x2})
        } else {
            for i, seg := range active {
                if seg.x1 == x1 && seg.x2 == x2 {
                    active = append(active[:i], active[i+1:]...)
                    break
                }
            }
        }
    }
    
    return res
}
