class Solution {
    public int numRescueBoats(int[] people, int limit) {
        Arrays.sort(people);
        int start = 0;
        int end = people.length - 1;
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
