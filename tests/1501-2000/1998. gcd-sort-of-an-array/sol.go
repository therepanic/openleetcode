type gcdDSU struct { p, sz []int }
func newGcdDSU(n int) *gcdDSU { p := make([]int,n); sz := make([]int,n); for i := range p { p[i] = i; sz[i] = 1 }; return &gcdDSU{p,sz} }
func (d *gcdDSU) find(x int) int { for d.p[x] != x { d.p[x] = d.p[d.p[x]]; x = d.p[x] }; return x }
func (d *gcdDSU) unite(a,b int) { a,b = d.find(a),d.find(b); if a == b { return }; if d.sz[a] < d.sz[b] { a,b = b,a }; d.p[b] = a; d.sz[a] += d.sz[b] }
func gcdSort(nums []int) bool {
    mx := 0; for _, x := range nums { if x > mx { mx = x } }
    d := newGcdDSU(mx + 1)
    for _, value := range nums {
        x := value
        for f := 2; f*f <= x; f++ { if x%f == 0 { d.unite(f,value); for x%f == 0 { x /= f } } }
        if x > 1 { d.unite(x,value) }
    }
    sorted := append([]int(nil), nums...)
    for i := 1; i < len(sorted); i++ { x,j := sorted[i],i-1; for j >= 0 && sorted[j] > x { sorted[j+1] = sorted[j]; j-- }; sorted[j+1] = x }
    for i := range nums { if d.find(nums[i]) != d.find(sorted[i]) { return false } }
    return true
}
