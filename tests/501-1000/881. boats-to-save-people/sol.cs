public class Solution {
    public int NumRescueBoats(int[] people, int limit) {
        Array.Sort(people);
        int start = 0;
        int end = people.Length - 1;
        int boats = 0;
        
        while (start <= end) {
            if (people[start] + people[end] <= limit) {
                start++;
                end--;
            } else {
                end--;
            }
            boats++;
        }
        
        return boats;
    }
}
