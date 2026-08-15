public class GcdSortUnionFind {
    private readonly int[] p;
    private readonly int[] size;
    public GcdSortUnionFind(int n) { p = new int[n]; size = new int[n]; for (int i=0;i<n;i++){p[i]=i;size[i]=1;} }
    public int Find(int x) { if (p[x] != x) p[x] = Find(p[x]); return p[x]; }
    public void Join(int a, int b) { int x=Find(a), y=Find(b); if (x==y) return; if(size[x]<size[y]){p[x]=y;size[y]+=size[x];}else{p[y]=x;size[x]+=size[y];} }
    public bool Connected(int a, int b) => Find(a) == Find(b);
}
public class Solution {
    public bool GcdSort(int[] nums) {
        int max = 0; foreach (int x in nums) if (x > max) max = x;
        var uf = new GcdSortUnionFind(max + 1);
        foreach (int value in nums) { int n=value; for(int f=2;f*f<=n;f++) if(n%f==0){uf.Join(f,value);while(n%f==0)n/=f;} if(n>1)uf.Join(n,value); }
        int[] sorted=(int[])nums.Clone(); System.Array.Sort(sorted);
        for(int i=0;i<nums.Length;i++) if(!uf.Connected(nums[i],sorted[i])) return false;
        return true;
    }
}
