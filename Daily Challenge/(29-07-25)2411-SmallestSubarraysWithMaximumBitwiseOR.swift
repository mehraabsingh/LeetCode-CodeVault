class Solution {
    func smallestSubarrays(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var result = [Int](repeating: 0, count: n)
        var lastPos = [Int](repeating: -1, count: 32) // Track last seen position for each bit
        
        for i in stride(from: n - 1, through: 0, by: -1) {
            for b in 0..<32 {
                if (nums[i] & (1 << b)) != 0 {
                    lastPos[b] = i // Bit b is seen at index i
                }
            }
            
            var maxReach = i
            for pos in lastPos {
                if pos != -1 {
                    maxReach = max(maxReach, pos)
                }
            }
            
            result[i] = maxReach - i + 1
        }
        
        return result
    }
}
