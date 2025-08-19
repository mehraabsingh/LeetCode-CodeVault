class Solution {
    func zeroFilledSubarray(_ nums: [Int]) -> Int {
        var count: Int64 = 0  // use Int64 to avoid overflow
        var streak: Int64 = 0
        
        for num in nums {
            if num == 0 {
                streak += 1
                count += streak
            } else {
                streak = 0
            }
        }
        
        return Int(count)
    }
}
