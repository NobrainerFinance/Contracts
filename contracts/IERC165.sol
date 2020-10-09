// SPDX-License-Identifier: MIT

pragma solidity 0.6.2;

/**
 * @dev Interface of the ERC165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[EIP].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
     /*
     It is possible to cause an arithmetic underflow. 
     Prevent the underflow by constraining inputs using the require() statement or use the OpenZeppelin SafeMath library for integer arithmetic operations. 
     Refer to the transaction trace generated for this issue to reproduce the underflow.
     https://swcregistry.io/docs/SWC-101
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}
