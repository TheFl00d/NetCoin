# NetCoin

Application created to demonstrate my expertise in Swift and iOS development. 
The NetCoin application displays list of 100 crypto currencies order by market cap. Coin are list along with price movement in percentage over the past 24hr.
This NetCoin mini project created in SwiftUI that uses the combine framework , MVVM architecture and Kingfisher as a third party dependency.
Api data is fetched using an Async await method that returns a tuple of arrays.


## Home Screen
On the start of app you should see this screen:
https://snipboard.io/DwTXqH.jpg
## Top Movers 
Shows a scrollable list of the top 8 coin the have the highest price percentage increase over the past 24hr

### Navigation Bar
Includes title. The right side arrow navigates to the user portfolio.
On the right is an icon that will display user account information including sign out button.


## Portfolio Screen
Portfolio should look like this: 
https://snipboard.io/7o0Q4T.jpg
This screen allows the user to view a list of personally select coins or personal coin portfolio.
The "+" option in the top left corner will allow the user to add more coins to their portfolio list

## Search Bar
https://snipboard.io/dXLgcS.jpg

This search feature allows the user to filter the list by name or symbol
The All coins list response dynamically to search bar input values
