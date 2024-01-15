// To parse this JSON data, do
//
//     final cartSummaryModel = cartSummaryModelFromJson(jsonString);

import 'dart:convert';

CartSummaryModel cartSummaryModelFromJson(String str) => CartSummaryModel.fromJson(json.decode(str));

String cartSummaryModelToJson(CartSummaryModel data) => json.encode(data.toJson());

class CartSummaryModel {
    Data data;
    int code;
    String message;
    bool isSuccess;

    CartSummaryModel({
        required this.data,
        required this.code,
        required this.message,
        required this.isSuccess,
    });

    factory CartSummaryModel.fromJson(Map<String, dynamic> json) => CartSummaryModel(
        data: Data.fromJson(json["data"]),
        code: json["code"],
        message: json["message"],
        isSuccess: json["isSuccess"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "code": code,
        "message": message,
        "isSuccess": isSuccess,
    };
}

class Data {
    CartProducts cartProducts;

    Data({
        required this.cartProducts,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        cartProducts: CartProducts.fromJson(json["cartProducts"]),
    );

    Map<String, dynamic> toJson() => {
        "cartProducts": cartProducts.toJson(),
    };
}

class CartProducts {
    double totalAmount;
    double subTotalAmount;
    double vat;
    int totalProducr;
    double totalTicket;
    List<CartResponse> cartResponse;

    CartProducts({
        required this.totalAmount,
        required this.subTotalAmount,
        required this.vat,
        required this.totalProducr,
        required this.totalTicket,
        required this.cartResponse,
    });

    factory CartProducts.fromJson(Map<String, dynamic> json) => CartProducts(
        totalAmount: json["totalAmount"],
        subTotalAmount: json["subTotalAmount"],
        vat: json["vat"],
        totalProducr: json["totalProducr"],
        totalTicket: json["totalTicket"],
        cartResponse: List<CartResponse>.from(json["cartResponse"].map((x) => CartResponse.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "totalAmount": totalAmount,
        "subTotalAmount": subTotalAmount,
        "vat": vat,
        "totalProducr": totalProducr,
        "totalTicket": totalTicket,
        "cartResponse": List<dynamic>.from(cartResponse.map((x) => x.toJson())),
    };
}

class CartResponse {
    int id;
    int memberId;
    String cookieId;
    double qty;
    String status;
    Product product;

    CartResponse({
        required this.id,
        required this.memberId,
        required this.cookieId,
        required this.qty,
        required this.status,
        required this.product,
    });

    factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
        id: json["id"],
        memberId: json["memberId"],
        cookieId: json["cookieId"],
        qty: json["qty"],
        status: json["status"],
        product: Product.fromJson(json["product"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "memberId": memberId,
        "cookieId": cookieId,
        "qty": qty,
        "status": status,
        "product": product.toJson(),
    };
}

class Product {
    int productCategoryId;
    int productId;
    String productCode;
    String productName;
    String description;
    String productImage;
    double price;
    String currency;
    int prizeId;
    String prizeCode;
    String prizeName;
    String prizeImage;
    dynamic prizeDescription;
    dynamic prizePrice;
    int productLimit;
    int winnerId;
    String status;
    String isSold;
    String aladinPlace;
    DateTime declareDate;
    DateTime announcedDate;
    DateTime announcedTime;
    String campaignTitle;
    String campaignSubTitle;
    String campaignDescription;
    String campaignImage;
    String icon;
    String joinImage;
    String remarks;
    int ticketOfferId;
    int soldQty;
    double rating;
    bool isWish;
    bool isPopular;

    Product({
        required this.productCategoryId,
        required this.productId,
        required this.productCode,
        required this.productName,
        required this.description,
        required this.productImage,
        required this.price,
        required this.currency,
        required this.prizeId,
        required this.prizeCode,
        required this.prizeName,
        required this.prizeImage,
        required this.prizeDescription,
        required this.prizePrice,
        required this.productLimit,
        required this.winnerId,
        required this.status,
        required this.isSold,
        required this.aladinPlace,
        required this.declareDate,
        required this.announcedDate,
        required this.announcedTime,
        required this.campaignTitle,
        required this.campaignSubTitle,
        required this.campaignDescription,
        required this.campaignImage,
        required this.icon,
        required this.joinImage,
        required this.remarks,
        required this.ticketOfferId,
        required this.soldQty,
        required this.rating,
        required this.isWish,
        required this.isPopular,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        productCategoryId: json["productCategoryId"],
        productId: json["productId"],
        productCode: json["productCode"],
        productName: json["productName"],
        description: json["description"],
        productImage: json["productImage"],
        price: json["price"],
        currency: json["currency"],
        prizeId: json["prizeId"],
        prizeCode: json["prizeCode"],
        prizeName: json["prizeName"],
        prizeImage: json["prizeImage"],
        prizeDescription: json["prizeDescription"]??'',
        prizePrice: json["prizePrice"],
        productLimit: json["productLimit"],
        winnerId: json["winnerId"],
        status: json["status"],
        isSold: json["isSold"],
        aladinPlace: json["aladinPlace"],
        declareDate: DateTime.parse(json["declareDate"]),
        announcedDate: DateTime.parse(json["announcedDate"]),
        announcedTime: DateTime.parse(json["announcedTime"]),
        campaignTitle: json["campaignTitle"],
        campaignSubTitle: json["campaignSubTitle"],
        campaignDescription: json["campaignDescription"],
        campaignImage: json["campaignImage"],
        icon: json["icon"],
        joinImage: json["joinImage"],
        remarks: json["remarks"],
        ticketOfferId: json["ticketOfferId"],
        soldQty: json["soldQty"],
        rating: json["rating"],
        isWish: json["isWish"],
        isPopular: json["isPopular"],
    );

    Map<String, dynamic> toJson() => {
        "productCategoryId": productCategoryId,
        "productId": productId,
        "productCode": productCode,
        "productName": productName,
        "description": description,
        "productImage": productImage,
        "price": price,
        "currency": currency,
        "prizeId": prizeId,
        "prizeCode": prizeCode,
        "prizeName": prizeName,
        "prizeImage": prizeImage,
        "prizeDescription": prizeDescription,
        "prizePrice": prizePrice,
        "productLimit": productLimit,
        "winnerId": winnerId,
        "status": status,
        "isSold": isSold,
        "aladinPlace": aladinPlace,
        "declareDate": declareDate.toIso8601String(),
        "announcedDate": announcedDate.toIso8601String(),
        "announcedTime": announcedTime.toIso8601String(),
        "campaignTitle": campaignTitle,
        "campaignSubTitle": campaignSubTitle,
        "campaignDescription": campaignDescription,
        "campaignImage": campaignImage,
        "icon": icon,
        "joinImage": joinImage,
        "remarks": remarks,
        "ticketOfferId": ticketOfferId,
        "soldQty": soldQty,
        "rating": rating,
        "isWish": isWish,
        "isPopular": isPopular,
    };
}
