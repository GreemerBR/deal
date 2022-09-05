import 'dart:convert';
import 'dart:typed_data';

const String imgAirFryer1 = 'assets/images/AirFryer1.jpg';
const String imgAirFryer2 = 'assets/images/AirFryer2.jpg';
const String imgAirFryer3 = 'assets/images/AirFryer3.jpg';

const String imgAvatar = 'assets/images/Avatar.jpeg';

const String imgBancoImobiliario1 = 'assets/images/BancoImobiliario1.jpg';
const String imgBancoImobiliario2 = 'assets/images/BancoImobiliario2.jpg';
const String imgBancoImobiliario3 = 'assets/images/BancoImobiliario3.jpg';

const String imgLawnMower1 = 'assets/images/lawnMower1.jpg';
const String imgLawnMower2 = 'assets/images/lawnMower2.jpg';
const String imgLawnMower3 = 'assets/images/lawnMower3.jpg';

const String imgSewingMachine1 = 'assets/images/sewingMachine1.jpg';
const String imgSewingMachine2 = 'assets/images/sewingMachine2.jpg';
const String imgSewingMachine3 = 'assets/images/sewingMachine3.jpg';

const String imgPopcornMaker1 = 'assets/images/popcornMaker1.jpg';
const String imgPopcornMaker2 = 'assets/images/popcornMaker2.jpg';
const String imgPopcornMaker3 = 'assets/images/popcornMaker3.jpg';

const String imgPs51 = 'assets/images/ps51.jpg';
const String imgPs52 = 'assets/images/ps52.jpg';
const String imgPs53 = 'assets/images/ps53.jpg';

const String imgTenisFustal1 = 'assets/images/TenisFutsal1.jpg';
const String imgTenisFustal2 = 'assets/images/TenisFutsal2.jpg';
const String imgTenisFustal3 = 'assets/images/TenisFutsal3.jpg';

const String imgBackgroundAbout = 'assets/images/backgroundAboutDeal.png';
const String imgBackgroundLogin = 'assets/images/background.png';
const String imgCamera = 'assets/images/camera.png';
const String imgChat = 'assets/images/chat.png';
const String imgFriendsSplash = 'assets/images/friendSplash.jpg';
const String imgLoginGoogle = 'assets/images/loginGoogle.png';
const String imgLogoApp = 'assets/images/iconApp.png';
const String imgNotFound = 'assets/images/image_not_found.png';
const String imgPeopleDeal = 'assets/images/deal_card.jpg';
const String imgPeopleLogin = 'assets/images/people.png';
const String imgSplashScreen = 'assets/images/splashscreen.png';
const String imgWelcome = 'assets/images/welcome.jpg';
const String imgWelcomeDeal = 'assets/images/welcome_card.jpg';

const String loginAnimation = 'assets/animations/loginAnimation.json';
const String notFoundAnimation = 'assets/animations/notFoundAnimation.json';

const List<String> imageListCard = [imgWelcomeDeal, imgPeopleDeal];


  Uint8List callImage(var infoImage) {
    return base64Decode(infoImage);
  }