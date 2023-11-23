class CarModel {
  int? advertismentID;
  double? price;
  String? createdDate;
  String? createdBy;
  String? lastModifiedDate;
  String? lastModifiedBy;
  int? advertTypeID;
  int? carBrandID;
  int? carTypeID;
  int? exhibitionProfileID;
  String? note;
  String? mainTitle;
  String? model;
  int? advertCityID;
  int? categoryTypeId;
  int? colorId;
  int? whatsappCounter;
  int? callCounter;
  String? description;
  String? keyWords;
  bool? isOnline;
  bool? isFinance;
  int? numberOfCars;
  double? registrationAmont;
  String? agencyWarranty;
  double? kilometers;
  String? mainImagePath;
  String? smallImagePath;
  String? brandName;
  String? typeName;
  String? userID;
  String? logopath;
  String? color;
  String? categoryType;
  String? city;
  String? rate;
  String? cityName;
  String? advertTypeName;
  int? hours;
  int? minuts;
  int? liked;
  int? exhibitionProfileID1;
  String? fullName;
  String? phone;
  String? exhibitionLogo;
  String? email;
  String? commercialRegister;
  String? municipalLicense;
  String? loginExpireDate;
  String? city1;
  String? rate1;
  String? userID1;
  String? createdDate1;
  String? lastModifiedDate1;
  bool? isLock;
  int? typeOfSubscriptionID;
  int? rateCount;
  String? roleName;
  int? pageNumber;

  CarModel({this.pageNumber});

  CarModel.fromJson(Map<String, dynamic> json) {
    advertismentID = json['AdvertismentID'];
    price = json['Price'];
    createdDate = json['CreatedDate'];
    createdBy = json['CreatedBy'];
    lastModifiedDate = json['LastModifiedDate'];
    lastModifiedBy = json['LastModifiedBy'];
    advertTypeID = json['AdvertTypeID'];
    carBrandID = json['CarBrandID'];
    carTypeID = json['CarTypeID'];
    exhibitionProfileID = json['ExhibitionProfileID'];
    note = json['Note'];
    mainTitle = json['MainTitle'];
    model = json['Model'];
    advertCityID = json['AdvertCityID'];
    categoryTypeId = json['CategoryTypeId'];
    colorId = json['ColorId'];
    whatsappCounter = json['WhatsappCounter'];
    callCounter = json['CallCounter'];
    description = json['Description'];
    keyWords = json['KeyWords'];
    isOnline = json['IsOnline'];
    isFinance = json['IsFinance'];
    numberOfCars = json['NumberOfCars'];
    registrationAmont = json['RegistrationAmont'];
    agencyWarranty = json['AgencyWarranty'];
    kilometers = json['Kilometers'];
    mainImagePath = json['MainImagePath'];
    smallImagePath = json['SmallImagePath'];
    brandName = json['BrandName'];
    typeName = json['TypeName'];
    userID = json['UserID'];
    logopath = json['logopath'];
    color = json['Color'];
    categoryType = json['CategoryType'];
    city = json['City'];
    rate = json['Rate'];
    cityName = json['CityName'];
    advertTypeName = json['AdvertTypeName'];
    hours = int.parse((json['Hours'] / 24).toStringAsFixed(0));
    minuts = json['Minuts'];
    liked = json['Liked'];
    exhibitionProfileID1 = json['ExhibitionProfileID1'];
    fullName = json['FullName'];
    phone = json['Phone'];
    exhibitionLogo = json['ExhibitionLogo'];
    email = json['Email'];
    commercialRegister = json['CommercialRegister'];
    municipalLicense = json['MunicipalLicense'];
    loginExpireDate = json['LoginExpireDate'];
    city1 = json['City1'];
    rate1 = json['Rate1'];
    userID1 = json['UserID1'];
    createdDate1 = json['CreatedDate1'];
    lastModifiedDate1 = json['LastModifiedDate1'];
    isLock = json['IsLock'];
    typeOfSubscriptionID = json['TypeOfSubscriptionID'];
    rateCount = json['RateCount'];
    roleName = json['RoleName'];
  }

  Map<String, dynamic> toJson() => {
        "advertCityId": 0,
        "advertTypeId": 2,
        "carBrandId": 0,
        "carTypeId": 0,
        "model": "",
        "priceFrom": 0.0,
        "priceTo": 0.0,
        "pageNumber": pageNumber,
        "rowsOfPage": 10
      };
}
