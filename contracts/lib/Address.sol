// SPDX-License-Identifier: MIT
pragma solidity =0.8.4;

library Address {
    function isContract(address _address) internal view returns (bool) {
        uint256 size;
        assembly {
            size := extcodesize(_address)
        }
        return size > 0;
    }

    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        (bool success, bytes memory returndata) = target.call(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function functionStaticCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        (bool success, bytes memory returndata) = target.staticcall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function functionDelegateCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        (bool success, bytes memory returndata) = target.delegatecall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function _verifyCallResult(
        bool success,
        bytes memory data,
        string memory errorMessage
    ) private pure returns (bytes memory) {
        if (success) return data;
        if (data.length == 0) revert(errorMessage);
        assembly {
            let data_size := mload(data)
            revert(add(32, data), data_size)
        }
    }
}
