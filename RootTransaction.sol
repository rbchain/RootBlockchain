/**
*
* This contract can be used to submit data(string) in Ethereum.
* In this transaction we will only store digital fingerprint of actual data.
* This way we can demonstrate that the the transaction is independent of actual data size.
 * And hence transaction cost and transaction time will remain same for data size.
**/
pragma solidity 0.4.18;

contract RootTransaction {
    address public owner;
    string public constant name = "Root Transaction";
    mapping(string => string) fingerprints;
    string[] public fingerprintKeyList;

    function RootTransaction() public{

    }

    function setFingerprint(string _uuid, string fingerprint) public returns (bool success) {
        fingerprints[_uuid] = fingerprint;

        fingerprintKeyList.push(_uuid);
        return true;
    }

    function getFingerprint(string _uuid) public constant returns (string fingerprint){
        fingerprint = fingerprints[_uuid];
    }

    function getFingerprintByIndex(uint _index) public constant returns (string fingerprint){
        fingerprint = fingerprints[fingerprintKeyList[_index]];
    }

    function getFingerprintCount()  public constant returns (uint){
        return fingerprintKeyList.length;
    }
}