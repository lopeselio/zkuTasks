# Question 6 screenshots

## Contract deployed on Javascript VM instance
![image](https://user-images.githubusercontent.com/43913734/172208597-9aa097b1-3e44-4812-9639-81f81149666f.png)

## At state 0: "Created", we see seller address, value is 10ETH and the purchase time is '0' as no purchase has been made yet
![image](https://user-images.githubusercontent.com/43913734/172209083-33b1b243-4c26-4410-876a-44c93f2e1238.png)

## If seller decides to abort without confirming purchase, state changed to '2': 'Inactive', buyer address is still '0x00' as he has not entered the escrow
![image](https://user-images.githubusercontent.com/43913734/172209431-f8ec0cac-9175-4f8e-a313-e5611135e069.png)

## Buyer confirms purchase, we now see the purchaseTime: '1654533051', state changes to '1':'Locked'. The transaction is now waiting to be completed. Also the balance for both buyer and seller is ~80ETH (refer to 2nd image in this section) and state changed to 1 (refer third image in this section)
![image](https://user-images.githubusercontent.com/43913734/172209563-b2f2c7e8-e8ca-42ca-ad92-8df4eeca0f08.png)
![image](https://user-images.githubusercontent.com/43913734/172210037-dcc1a431-9d27-42ef-9c65-12aa98aa8059.png)
![image](https://user-images.githubusercontent.com/43913734/172210010-1e0b5fba-fe56-488a-89fc-84f82448b963.png)


After 5 minutes of purchasing
## Only the buyer can call this function to complete the purchase (refer 1st image in this section). The seller receives ~10ETH (Total balance: ~110ETH), the buyer's account has ~90ETH, this amount is reflected correctly from the purchase(refer 2nd image in this section). State changes to '2':'Inactive', the escrow now becomes inactive
![image](https://user-images.githubusercontent.com/43913734/172210606-dc6ba830-585b-46c3-9540-7e4a616a64ed.png)
![image](https://user-images.githubusercontent.com/43913734/172210629-c86d832f-703e-49bd-88b2-28598ecf7d77.png)
<img width="354" alt="image" src="https://user-images.githubusercontent.com/43913734/172210714-70493fda-57d1-4cb6-9e7e-759c819d9821.png">

# Before 5 minutes executing completePurchase:
<img width="1070" alt="image" src="https://user-images.githubusercontent.com/43913734/172212238-040edfc1-e5e5-4b17-bb3a-c40bd01547dd.png">






