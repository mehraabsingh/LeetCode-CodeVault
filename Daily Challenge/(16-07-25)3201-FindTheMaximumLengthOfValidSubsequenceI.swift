class Solution {
    func maximumLength(_ nums: [Int]) -> Int {
        var count = 1
        for i in 1..<nums.count {
            if (nums[i] + nums[i - 1]) % 2 != 0 {
                count += 1
            }
        }
        return count
    }
}
