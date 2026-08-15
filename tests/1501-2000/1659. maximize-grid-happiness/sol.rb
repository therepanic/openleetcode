def get_max_grid_happiness(m,n,introverts_count,extroverts_count)
  i,e=introverts_count,extroverts_count
  m,n=n,m if n>m; k=3**n; st=[]
  k.times{|x|a=x;h=ii=ee=prev=0;n.times{|j|d=a%3;a/=3;if d==1;h+=120;ii+=1;elsif d==2;h+=40;ee+=1;end;h+=(d==1 ? -30:20)+(prev==1 ? -30:20) if d>0&&prev>0;prev=d};st<<[h,ii,ee]}
  mem={}; f=->(r,ii,ee,p){return 0 if r==m;key=[r,ii,ee,p];return mem[key] if mem[key];mem[key]=(0...k).select{|c|st[c][1]<=ii&&st[c][2]<=ee}.map{|c|a=p;b=c;s=0;n.times{u=a%3;d=b%3;a/=3;b/=3;s+=(u==1 ? -30:20)+(d==1 ? -30:20) if u>0&&d>0};st[c][0]+s+f.call(r+1,ii-st[c][1],ee-st[c][2],c)}.max};f.call(0,i,e,0)
end
