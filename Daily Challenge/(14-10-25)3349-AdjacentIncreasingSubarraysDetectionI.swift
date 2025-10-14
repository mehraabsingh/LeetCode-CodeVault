class Solution {
    func hasIncreasingSubarrays(_ nums: [Int], _ k: Int) -> Bool {
        let n = nums.count
        
        // Helper function to check if subarray nums[l..<r] is strictly increasing
        func isIncreasing(_ l: Int, _ r: Int) -> Bool {
            for i in l..<r-1 {
                if nums[i] >= nums[i + 1] {
                    return false
                }
            }
            return true
        }

        // Loop through all possible starting indices for first subarray
        for i in 0...(n - 2 * k) {
            // First subarray: nums[i..<(i + k)]
            // Second subarray: nums[(i + k)..<(i + 2 * k)]
            if isIncreasing(i, i + k) && isIncreasing(i + k, i + 2 * k) {
                return true
            }
        }

        return false
    }
}
