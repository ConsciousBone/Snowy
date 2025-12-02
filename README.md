# Snowy
Snowy is an iOS/iPadOS app that lets you create digital snowmen!  
Built for Hack Club's Siege Week 13 following the theme of `Winter`.   
It supports iPhone and iPad, as well as Mac and Apple Vision Pro using *Designed for iPad*!  

# Demos
## Screenshots
<img src="/Screenshots/1.png" width=128> <img src="/Screenshots/2.png" width=128> <img src="/Screenshots/3.png" width=128>
<img src="/Screenshots/4.png" width=128> <img src="/Screenshots/5.png" width=128> <img src="/Screenshots/6.png" width=128>
<img src="/Screenshots/7.png" width=128> <img src="/Screenshots/8.png" width=128> <img src="/Screenshots/9.png" width=128>
<img src="/Screenshots/10.png" width=128> <img src="/Screenshots/11.png" width=128>
## Video
[YouTube link (unlisted, yt made it a short for some reason ;-;)](https://youtube.com/shorts/TSEUMoj17FY)

# How to get Snowy
As per usual for all my Siege projects, this is the way I recommend, but there are indeed other ways to sideload apps onto iOS/iPadOS/etc devices such as AltStore and SideStore; they will all work, there's no reason for them not to!
1. Install [Sideloadly](https://sideloadly.io) and its dependencies; if I remember correctly there are none on macOS but Windows needs iTunes and iCloud **not from the Microsoft Store**; the Sideloadly website will have links to all dependencies you need for your OS.
2. From the [Releases](https://github.com/ConsciousBone/Snowy/releases/tag/stable) tab, find the latest release - it should be at the top -, and download the attached `Snowy.ipa` file.
3. Using a cable that supports both charge *and* data transfer, connect your device to your computer, tap `Trust` if promped to and enter your password, then open Sideloadly.
4. In Sideloadly, click the file icon with the `IPA` text, and select the previously downloaded `Snowy.ipa` file.
5. Select your device in the `iDevice` dropdown, and make sure the name matches with the device you wish to sideload Snowy to.
6. In the `Apple ID` text field, enter your Apple Account/ID's email. If you use a free Apple developer account, you will need to reinstall/resign Snowy every 7 days; with a paid dev account you only have to reinstall/resign Snowy once every 365 days!
7. Click the `Start` button, and enter your Apple Account/ID's password when prompted. **No one apart from you and Apple will see this password - not the Sideloadly devs and not me.**
8. Wait for the app to install, and then launch it! *If you are prompted to enable Developer Mode or trust the app/dev, so do.*

# Inspiration
It's finally winter, and so is this week's Siege theme! With the UK getting hardly any snow most years, it's rare we can enjoy making snowmen, so as a solution I decided to make virtual snowmen, experienced entirely through your iPhone or iPad!

# Tech stack
- Swift (what basically every modern app for Apple platforms is written in, if the developer has some mental sanity)
- SwiftUI (what the app's UI is built with; incredible UI framework, does most of the work for me, stupid easy to use, tyvm Apple)
- SwiftData (to store the snowmen)
