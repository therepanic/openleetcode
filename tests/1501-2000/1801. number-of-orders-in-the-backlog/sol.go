import hq "container/heap"

type IntHeap [][]int

func (h IntHeap) Len() int           { return len(h) }
func (h IntHeap) Less(i, j int) bool { return h[i][0] < h[j][0] }
func (h IntHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }
func (h *IntHeap) Push(x interface{}) { *h = append(*h, x.([]int)) }
func (h *IntHeap) Pop() interface{} {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[0 : n-1]
    return x
}

type MaxHeap [][]int
func (h MaxHeap) Len() int { return len(h) }
func (h MaxHeap) Less(i, j int) bool { return h[i][0] > h[j][0] }
func (h MaxHeap) Swap(i, j int) { h[i], h[j] = h[j], h[i] }
func (h *MaxHeap) Push(x interface{}) { *h = append(*h, x.([]int)) }
func (h *MaxHeap) Pop() interface{} { old := *h; n := len(old); x := old[n-1]; *h = old[:n-1]; return x }

func getNumberOfBacklogOrders(orders [][]int) int {
    buy := make(MaxHeap, 0)
    sell := make(IntHeap, 0)
    hq.Init(&buy)
    hq.Init(&sell)
    for _, order := range orders {
        price, amount, orderType := order[0], order[1], order[2]
        if orderType == 0 {
            for len(sell) > 0 && sell[0][0] <= price {
                s := hq.Pop(&sell).([]int)
                if amount >= s[1] {
                    amount -= s[1]
                } else {
                    hq.Push(&sell, []int{s[0], s[1] - amount})
                    amount = 0
                    break
                }
            }
        } else {
            for len(buy) > 0 && buy[0][0] >= price {
                b := hq.Pop(&buy).([]int)
                if amount >= b[1] {
                    amount -= b[1]
                } else {
                    hq.Push(&buy, []int{b[0], b[1] - amount})
                    amount = 0
                    break
                }
            }
        }
        if amount > 0 {
            if orderType == 0 {
                hq.Push(&buy, []int{price, amount})
            } else {
                hq.Push(&sell, []int{price, amount})
            }
        }
    }
    res := 0
    for _, x := range buy {
        res += x[1]
    }
    for _, x := range sell {
        res += x[1]
    }
    return res % 1000000007
}
