// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;
contract Purchase {
    uint public value;
    address payable public seller;
    address payable public buyer;
    uint256 public purchaseTime; 

    enum State { Created, Locked, Inactive }
    // The state variable has a default value of the first member, `State.created`
    State public state;
    /// Only the seller can call this function.
    error OnlySeller();
    /// The function cannot be called at the current state.
    error InvalidState();
    /// The provided value has to be even.
    error ValueNotEven();
    // Only allowed addresses can access the access the fucntion
    error NotAllowed();

    modifier condition(bool condition_) {
        require(condition_);
        _;
    }

    modifier onlySeller() {
        if (msg.sender != seller)
            revert OnlySeller();
        _;
    }

    modifier inState(State state_) {
        if (state != state_)
            revert InvalidState();
        _;
    }

    modifier isTransactionAllowed() {
        // after omitting the onlybuyer modifier, we include a single modifier to include payments to both buyer and seller in single function 
        // If msg.sender is not the buyer and that the transaction was made less than 5 minutes ago after the purchase block timestamp, then we revert with NotAllowed error
        if (msg.sender != buyer && block.timestamp < purchaseTime + 5 minutes) {
            revert NotAllowed();
        }
        _;
    }

    event Aborted();
    event PurchaseConfirmed();
    event ItemReceived();
    event SellerRefunded();

    // Ensure that `msg.value` is an even number.
    // Division will truncate if it is an odd number.
    // Check via multiplication that it wasn't an odd number.
    constructor() payable {
        seller = payable(msg.sender);
        value = msg.value / 2;
        if ((2 * value) != msg.value)
            revert ValueNotEven();
    }

    /// Abort the purchase and reclaim the ether.
    /// Can only be called by the seller before
    /// the contract is locked.
    function abort()
        external
        onlySeller
        inState(State.Created)
    {
        emit Aborted();
        state = State.Inactive;
        // We use transfer here directly. It is
        // reentrancy-safe, because it is the
        // last call in this function and we
        // already changed the state.
        seller.transfer(address(this).balance);
    }

    /// Confirm the purchase as buyer.
    /// Transaction has to include `2 * value` ether.
    /// The ether will be locked until confirmReceived
    /// is called.
    function confirmPurchase()
        external
        inState(State.Created)
        condition(msg.value == (2 * value))
        payable
    {
        emit PurchaseConfirmed();
        buyer = payable(msg.sender);
        state = State.Locked;
        purchaseTime = block.timestamp;
    }

    /// This function complete the purchase, i.e.
    /// confirms that the item was received, and release the funds.
    function completePurchase()
        external
        inState(State.Locked)
        isTransactionAllowed
    {
        // As explained in the original contract comments, we change the state first, and then transfer the value
        emit ItemReceived();
        state = State.Inactive; 
        // Since we're complete both transfers wrt to buyer and seller in the same transaction, we do not need to call the "Release" state
        buyer.transfer(value);

        emit SellerRefunded();
        seller.transfer(3 * value);
    }
}
