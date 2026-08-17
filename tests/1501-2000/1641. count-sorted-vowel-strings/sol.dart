class Solution {
  int countVowelStrings(int n) {
    if(n==1){
      return 5;
    }else if(n==2){
      return 15;
    }else if(n==3){
      return 35;
    }
    List<int> x=List.filled(n-2,0);
    x[0]=10;
    int c=5;
    for(int i=0;i<n-3;i++){
      x[i+1]=x[i]+c;
      c++;
    }
    List<int> y=List.filled(n-1,0);
    y[0]=10;
    for(int i=0;i<n-2;i++){
      y[i+1]=y[i]+x[i];
    }
    int sum=0;
    for(int val in y){
      sum+=val;
    }
    return sum+5;
  }
}
