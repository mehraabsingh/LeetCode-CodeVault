import java.util.HashMap;
import java.util.Map;

class Solution {
    public int countTrapezoids(int[][] points) {
        Map<Integer, Integer> map = new HashMap<>();
        for (int[] point : points) {
            map.put(point[1], map.getOrDefault(point[1], 0) + 1);
        }
        
        long mod = 1_000_000_007L;
        long sum = 0;
        long sumSq = 0;
        
        for (int count : map.values()) {
            if (count < 2) continue;
            long pairs = (long) count * (count - 1) / 2;
            pairs %= mod;
            
            sum = (sum + pairs) % mod;
            sumSq = (sumSq + pairs * pairs) % mod;
        }
        
        long ans = (sum * sum - sumSq) % mod;
        if (ans < 0) ans += mod;
        ans = (ans * 500000004L) % mod;
        
        return (int) ans;
    }
}
