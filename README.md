# TipJar
An app built using SwiftUI. The purpose of the app is that it is a tip calculator based on user input. Built as part of the technical test for Bitcoin.com.

## Installation

- Clone the project.

```bash
git clone https://github.com/azharislam/FruitPedia.git
```
- Open the project in Xcode and run on simulator or device (iOS 15+)
- No third party libraries were used in the development of this project.


## Screenshots

[![Simulator-Screen-Shot-i-Phone-13-2022-05-03-at-01-50-08.png](https://i.postimg.cc/DZGP2nV8/Simulator-Screen-Shot-i-Phone-13-2022-05-03-at-01-50-08.png)](https://postimg.cc/tZXxk04j)

## Features

- User input calculator 
- Camera functionality
- View saved data locally/offline
- Interactive onboarding process

## Documentation

The main view of the app ```TipSectionView``` was built using generic view builders. There was a lot of 
components in the main view of the design which made me go with this procedure. I made some of the components in this view separetely to increase reusability. The components involve a custom keyboard,
camera view, alert and textfield. These all bind to variables and functions that are inside ```TipSectionViewModel```. 

This view model is injected into both my ```TipSectionView``` and ```PaymentListView```. It uses ```Combine``` to calculate user input, which are abstracted into custom functions that can calculate the user input and display the data, data that abides to the UI design. As well as this, I used ```Combine``` to save the image from the user taking a photo and store it in file directory. There are also functions and variables that are used to output user input in the desired format and validation.

The image saving/fetching is managed in ```ImageStoreManager``` and the data is saved locally using ```Core Data```, which has a store class called ```CoreDataStoreManager```. This class has been made to take two types of storage, this is done so that it can be tested in the unit tests section and the data from tests doesn't conflict with the main app data. 

The list view ```PaymentListView``` was built in a simple view using SwiftUI components. I check if the data array from the view model is empty, if it is display a custom empty view, otherwise display
the data in a custom view ```SavedPaymentView```, which is populated using a SwiftUI ```Button```. The action on the button will enable the user to see their payment in detail via the detail view ```PaymentDetailView```.

Aside from the above, I added a custom launch screen and onboarding process to make the user experience better. 

The unit tests test the logic of the ```TipSectionViewModel```, ```ImageStoreManager```and ```CoreDataStoreManager```.

## Evaluation

Overall I enjoyed this test, it allowed me to use my SwiftUI and Combine skills which I have been brushing up on for the past year. If I had more time,
I would implement extra UI features to enhance user experience, add UI tests to increase robustness and also add the 'select currency' feature.

## Acknowledgements

Thank you to the team at Bitcoin.com for providing the source test file and also the opportunity. I look forward to your feedback! 
