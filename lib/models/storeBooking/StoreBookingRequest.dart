import 'dart:convert';

class Booking {
  final String packageId;
  final String userId;
  final String packageName;
  final String firstName;
  final String lastName;
  final String email;
  final String ccEmail;
  final String phone;
  final String countryCode;
  final String noOfDays;
  final String eventDate;
  final String totalPax;
  final String totalCost;
  final String totalDiscount;
  final String totalGst;
  final String totalAmount;
  final String isCreditNoteUsed;
  final String isGiftCardUsed;
  final String totalAmountToPay;
  final String totalAmountPaid;
  String remainingAmount;
  final String roundOffAmount;
  final String convenienceFee;
  final String paymentType;
  final List<Cost> cost;

  Booking({
    required this.packageId,
    required this.userId,
    required this.packageName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.ccEmail,
    required this.phone,
    required this.countryCode,
    required this.noOfDays,
    required this.eventDate,
    required this.totalPax,
    required this.totalCost,
    required this.totalDiscount,
    required this.totalGst,
    required this.totalAmount,
    required this.isCreditNoteUsed,
    required this.isGiftCardUsed,
    required this.totalAmountToPay,
    required this.totalAmountPaid,
    required this.remainingAmount,
    required this.roundOffAmount,
    required this.convenienceFee,
    required this.paymentType,
    required this.cost,
  });



  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      packageId: json['package_id'],
      userId: json['user_id'],
      packageName: json['package_name'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      ccEmail: json['cc_email'],
      phone: json['phone'].toString(),
      countryCode: json['country_code'].toString(),
      noOfDays: json['no_of_days'],
      eventDate: json['event_date'],
      totalPax: json['total_pax'],
      totalCost: json['total_cost'],
      totalDiscount: json['total_discount'],
      totalGst: json['total_gst'],
      totalAmount: json['total_amount'],
      isCreditNoteUsed: json['is_credit_note_used'],
      isGiftCardUsed: json['is_gift_card_used'],
      totalAmountToPay: json['total_amount_to_pay'],
      totalAmountPaid: json['total_amount_paid'],
      remainingAmount: json['remaining_amount'],
      roundOffAmount: json['round_off_amount'],
      convenienceFee: json['convenience_fee'],
      paymentType: json['payment_type'],
      cost: (json['cost'] as List).map((i) => Cost.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'package_id': packageId,
      'user_id': userId,
      'package_name': packageName,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'cc_email': ccEmail,
      'phone': phone,
      'country_code': countryCode,
      'no_of_days': noOfDays,
      'event_date': eventDate,
      'total_pax': totalPax,
      'total_cost': totalCost,
      'total_discount': totalDiscount,
      'total_gst': totalGst,
      'total_amount': totalAmount,
      'is_credit_note_used': isCreditNoteUsed,
      'is_gift_card_used': isGiftCardUsed,
      'total_amount_to_pay': totalAmountToPay,
      'total_amount_paid': totalAmountPaid,
      'remaining_amount': remainingAmount,
      'round_off_amount': roundOffAmount,
      'convenience_fee': convenienceFee,
      'payment_type': paymentType,
      'cost': cost.map((i) => i.toJson()).toList(),
    };
  }
}

class Cost {
  final String packageItineraryId;
  final String travelModeId;
  final String travelModeName;
  final String riderId;
  final String riderName;
  final String occupancyId;
  final String occupancyName;
  final String packagePrice;
  final String packageDiscount;
  final String packagePriceAfterDiscount;
  final String packageGst;
  final String pax;
  final String amount;

  Cost({
    required this.packageItineraryId,
    required this.travelModeId,
    required this.travelModeName,
    required this.riderId,
    required this.riderName,
    required this.occupancyId,
    required this.occupancyName,
    required this.packagePrice,
    required this.packageDiscount,
    required this.packagePriceAfterDiscount,
    required this.packageGst,
    required this.pax,
    required this.amount,
  });

  factory Cost.fromJson(Map<String, dynamic> json) {
    return Cost(
      packageItineraryId: json['package_itinerary_id'],
      travelModeId: json['travel_mode_id'],
      travelModeName: json['travel_mode_name'],
      riderId: json['rider_id'],
      riderName: json['rider_names'],
      occupancyId: json['occupancy_id'],
      occupancyName: json['occupancy_name'],
      packagePrice: json['package_price'],
      packageDiscount: json['package_discount'],
      packagePriceAfterDiscount: json['package_price_after_discount'],
      packageGst: json['package_gst'],
      pax: json['pax'],
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'package_itinerary_id': packageItineraryId,
      'travel_mode_id': travelModeId,
      'rider_id': riderId,
      'occupancy_id': occupancyId,
      'package_price': packagePrice,
      'package_discount': packageDiscount,
      'package_price_after_discount': packagePriceAfterDiscount,
      'package_gst': packageGst,
      'pax': pax,
      'amount': amount,
    };
  }
}
