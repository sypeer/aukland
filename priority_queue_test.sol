
pragma solidity >=0.4.22 <0.6.0;
    import "remix_tests.sol"; // this import is automatically injected by Remix.
    import "./priority_queue.sol";

    contract test_1 {

        PriorityQueue priorityqueueToTest;

        function beforeAll() public {
            priorityqueueToTest = new PriorityQueue();
        }

        // Check if queue is empty
        function checkIfEmpty() public {
            Assert.equal(priorityqueueToTest.isEmpty(), true, 'Should return True');
        }

        function checkPeek() public {
            priorityqueueToTest.insert(0, 5);
            Assert.equal(priorityqueueToTest.isEmpty(), false, 'Should return False');
            Assert.equal(priorityqueueToTest.peek(), uint(0), 'Should return 0');
        }

        // Add elements and associated priorities to queue
        function addToQueue() public {
            priorityqueueToTest.insert(1, 10);
            priorityqueueToTest.insert(2, 3);
            priorityqueueToTest.insert(3, 4);
            priorityqueueToTest.insert(4, 6);
        }

        // Check pop
        function checkPop() public {
            Assert.equal(priorityqueueToTest.pop(), uint(1), 'Should be 1');
            Assert.equal(priorityqueueToTest.pop(), uint(4), 'Should be 4');
            Assert.equal(priorityqueueToTest.pop(), uint(0), 'Should be 0');
            Assert.equal(priorityqueueToTest.pop(), uint(3), 'Should be 3');
            Assert.equal(priorityqueueToTest.pop(), uint(2), 'Should be 2');

            Assert.equal(priorityqueueToTest.isEmpty(), true, 'Should return True');
        }
    }
