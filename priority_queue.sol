pragma solidity >=0.4.21 <0.6.0;

contract PriorityQueue {

    uint[] public array;
    uint public itemIndex;

    mapping (uint => PQ) public hashMap;

    struct PQ {
        uint element;
        uint priority;
    }

    // Create a new priority queue
    constructor() public {
        itemIndex = 0;
    }

    // Check whether the queue has no elements
    function isEmpty() public view returns (bool) {
        if(itemIndex == 0) {
            return (true);
        } else {
            return (false);
        }
    }

    //  Return the highest priority element but do not modify the queue
    function peek() public view returns (uint) {
        PQ memory pq = hashMap[1];
        return (uint(pq.element));
    }

    // Add an element to the queue with an associated priority
    function insert(uint _element, uint _priority) public payable {
        uint currentIndex = itemIndex+1;
        uint parentIndex = currentIndex-1;
        PQ memory pq = PQ(_element, _priority);
        // Add element and priority to the end of the queue
        hashMap[currentIndex] = pq;
        itemIndex +=1;

        if (currentIndex > 1) {
            PQ memory parentPQ = hashMap[parentIndex];
            // Move the currrent element to the front of the queue based on the priority value
            while (currentIndex > 1 && parentPQ.priority < pq.priority) {
                if(pq.priority > parentPQ.priority) {
                    PQ memory tempParent = hashMap[parentIndex];
                    PQ memory tempCurrent = hashMap[currentIndex];
                    (hashMap[parentIndex], hashMap[currentIndex]) = (tempCurrent, tempParent);
                }
                currentIndex = parentIndex;
            }
        }

    }

    // Remove the element from the queue that has the highest priority, and return it
    function pop() public returns (uint) {
        PQ memory pq = hashMap[1];
        // Store element with highest priority
        uint highestElement =  pq.element;
        // Remove the element with the highest priority
        uint i = 0;
        for (i=1; i<=itemIndex; i++) {
            hashMap[i] = hashMap[i+1];
        }
        itemIndex = itemIndex-1;
        // Return stored element
        return (highestElement);
    }
}
