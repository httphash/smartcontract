pragma solidity ^0.4.7;

contract HTTPhashStorage {

    /*
    *
    *   HTTPhash
    *
    */

    address private owner;
    uint32 private counter;
    mapping(uint32 => string) private httphash;
    mapping(uint32 => uint256) private blocktime;

    modifier ownerFunction {

      require(owner == msg.sender);
      _;

    }

    function HTTPhashStorage() {

      owner = msg.sender;
      counter = 0;

    }

    function insertHash(string sha3_256) ownerFunction {

        httphash[counter] = sha3_256;
        blocktime[counter] = block.timestamp;
        counter += 1;

    }

    function viewHashById(uint32 datapointer) view public returns (string value) {

        value = httphash[datapointer];

    }

    function viewBlockTimestampById(uint32 datapointer) view public returns (uint256 value) {

        value = blocktime[datapointer];

    }

    function viewHTTPhashElementsCount() view public returns (uint32 value) {

        value = counter;

    }

}
