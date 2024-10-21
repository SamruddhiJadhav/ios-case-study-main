
Current Scope:
1. I have used VIPER architecture for UI and written test for DealDetailsPresenter and DealsListMapper. I have also added test to check if system user test has been deallcated or not after the scope has ened to catch nay memory leak.

2. In case sale price not available, I am just showing regular price.

3. For error handling, I am showing blanket Alert to User, which can be further elaborated in details letting the user know what actually happened and why user can do like refresh or try again or just close. This can be done in future.

4. I am using SDWebImage to fetch and cache images (in original size).


Future Scope:
If I had more time I would have implemented,
1. More Unit Tests, few Integration Tests and UITest for critical flow only as per the test pyramid. Snapshot test would have helped with understanding the intended UI changes.
2. Cache resized images. But for scalability and reducing the burden from mobile client, we should be able to request image from backend for such standard sizes by using query parameters on image URL.
3. Deal Listing api can be paginated, such that in real scenarios when we have many deals we should be able to load as per need and save bandwidth.
