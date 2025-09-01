class Solution {
    func maxAverageRatio(_ classes: [[Int]], _ extraStudents: Int) -> Double {
        // Custom max heap using priority queue
        struct ClassNode {
            var p: Double
            var t: Double
            var gain: Double {
                return (p + 1) / (t + 1) - (p / t)
            }
        }
        
        // Max-heap
        var heap = Heap<ClassNode>(sort: { $0.gain > $1.gain })
        
        for c in classes {
            heap.insert(ClassNode(p: Double(c[0]), t: Double(c[1])))
        }
        
        var remaining = extraStudents
        while remaining > 0 {
            if var top = heap.remove() {
                top.p += 1
                top.t += 1
                heap.insert(top)
            }
            remaining -= 1
        }
        
        var sum: Double = 0.0
        while let node = heap.remove() {
            sum += node.p / node.t
        }
        
        return sum / Double(classes.count)
    }
}

// Generic Heap Implementation
struct Heap<T> {
    var nodes = [T]()
    var sort: (T, T) -> Bool
    
    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }
    
    var isEmpty: Bool { nodes.isEmpty }
    
    mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        if nodes.count == 1 { return nodes.removeFirst() }
        let value = nodes[0]
        nodes[0] = nodes.removeLast()
        shiftDown(0)
        return value
    }
    
    mutating func shiftUp(_ index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && sort(nodes[child], nodes[parent]) {
            nodes.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    mutating func shiftDown(_ index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent
            if left < nodes.count && sort(nodes[left], nodes[candidate]) {
                candidate = left
            }
            if right < nodes.count && sort(nodes[right], nodes[candidate]) {
                candidate = right
            }
            if candidate == parent { return }
            nodes.swapAt(parent, candidate)
            parent = candidate
        }
    }
}
