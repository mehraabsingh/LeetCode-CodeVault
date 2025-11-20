import java.util.*;

class Solution {
    public int intersectionSizeTwo(int[][] intervals) {
        Arrays.sort(intervals, (a, b) -> a[1] == b[1] ? b[0] - a[0] : a[1] - b[1]);
        List<Integer> arr = new ArrayList<>();
        int a = -1, b = -1;

        for (int[] in : intervals) {
            int start = in[0], end = in[1];
            if (start > b) {
                arr.add(end - 1);
                arr.add(end);
                a = end - 1;
                b = end;
            } else if (start > a) {
                arr.add(end);
                a = b;
                b = end;
            }
        }
        return arr.size();
    }
}
