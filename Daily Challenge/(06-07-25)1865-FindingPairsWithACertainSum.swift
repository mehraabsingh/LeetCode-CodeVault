class FindSumPairs {
    private var nums1: [Int]
    private var nums2: [Int]
    private var freqMap: [Int: Int]

    init(_ nums1: [Int], _ nums2: [Int]) {
        self.nums1 = nums1
        self.nums2 = nums2
        self.freqMap = [:]

        for num in nums2 {
            freqMap[num, default: 0] += 1
        }
    }

    func add(_ index: Int, _ val: Int) {
        let oldValue = nums2[index]
        let newValue = oldValue + val

        // Update the frequency map
        freqMap[oldValue]! -= 1
        if freqMap[oldValue]! == 0 {
            freqMap.removeValue(forKey: oldValue)
        }

        freqMap[newValue, default: 0] += 1
        nums2[index] = newValue
    }

    func count(_ tot: Int) -> Int {
        var result = 0
        for num in nums1 {
            let complement = tot - num
            if let count = freqMap[complement] {
                result += count
            }
        }
        return result
    }
}
