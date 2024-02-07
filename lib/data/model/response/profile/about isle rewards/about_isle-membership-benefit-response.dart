class AboutIsleMembershipBenefitResponse {
  int? statusCode;
  String? status;
  String? message;
  List<AboutIsleMembershipBenefitData>? data;

  AboutIsleMembershipBenefitResponse(
      {this.statusCode, this.status, this.message, this.data});

  AboutIsleMembershipBenefitResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AboutIsleMembershipBenefitData>[];
      json['data'].forEach((v) {
        data!.add(new AboutIsleMembershipBenefitData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AboutIsleMembershipBenefitData {
  int? id;
  String? placeholder;
  String? rule;
  int? sortOrder;
  int? spentAmount;
  int? perRewardPoint;
  int? firstOrderDiscount;
  String? firstOrderDiscountType;
  int? earlyAccessHours;
  int? purchaseAmount;
  bool? status;
  String? createdAt;
  String? updatedAt;
  List<MembershipIsleRewardRules>? membershipIsleRewardRules;

  AboutIsleMembershipBenefitData(
      {this.id,
        this.placeholder,
        this.rule,
        this.sortOrder,
        this.spentAmount,
        this.perRewardPoint,
        this.firstOrderDiscount,
        this.firstOrderDiscountType,
        this.earlyAccessHours,
        this.purchaseAmount,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.membershipIsleRewardRules});

  AboutIsleMembershipBenefitData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    placeholder = json['placeholder'];
    rule = json['rule'];
    sortOrder = json['sort_order'];
    spentAmount = json['spent_amount'];
    perRewardPoint = json['per_reward_point'];
    firstOrderDiscount = json['first_order_discount'];
    firstOrderDiscountType = json['first_order_discount_type'];
    earlyAccessHours = json['early_access_hours'];
    purchaseAmount = json['purchase_amount'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['membership_isle_reward_rules'] != null) {
      membershipIsleRewardRules = <MembershipIsleRewardRules>[];
      json['membership_isle_reward_rules'].forEach((v) {
        membershipIsleRewardRules!
            .add(new MembershipIsleRewardRules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['placeholder'] = this.placeholder;
    data['rule'] = this.rule;
    data['sort_order'] = this.sortOrder;
    data['spent_amount'] = this.spentAmount;
    data['per_reward_point'] = this.perRewardPoint;
    data['first_order_discount'] = this.firstOrderDiscount;
    data['first_order_discount_type'] = this.firstOrderDiscountType;
    data['early_access_hours'] = this.earlyAccessHours;
    data['purchase_amount'] = this.purchaseAmount;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.membershipIsleRewardRules != null) {
      data['membership_isle_reward_rules'] =
          this.membershipIsleRewardRules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MembershipIsleRewardRules {
  int? id;
  int? isleRewardRuleId;
  int? membershipTiersId;
  int? rewardPoint;
  int? rewardAmount;
  bool? available;
  int? bonusPointMultiplier;
  String? createdAt;
  String? updatedAt;
  MembershipTier? membershipTier;

  MembershipIsleRewardRules(
      {this.id,
        this.isleRewardRuleId,
        this.membershipTiersId,
        this.rewardPoint,
        this.rewardAmount,
        this.available,
        this.bonusPointMultiplier,
        this.createdAt,
        this.updatedAt,
        this.membershipTier});

  MembershipIsleRewardRules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isleRewardRuleId = json['isle_reward_rule_id'];
    membershipTiersId = json['membership_tiers_id'];
    rewardPoint = json['reward_point'];
    rewardAmount = json['reward_amount'];
    available = json['available'];
    bonusPointMultiplier = json['bonus_point_multiplier'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    membershipTier = json['membership_tier'] != null
        ? new MembershipTier.fromJson(json['membership_tier'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isle_reward_rule_id'] = this.isleRewardRuleId;
    data['membership_tiers_id'] = this.membershipTiersId;
    data['reward_point'] = this.rewardPoint;
    data['reward_amount'] = this.rewardAmount;
    data['available'] = this.available;
    data['bonus_point_multiplier'] = this.bonusPointMultiplier;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.membershipTier != null) {
      data['membership_tier'] = this.membershipTier!.toJson();
    }
    return data;
  }
}

class MembershipTier {
  int? id;
  String? tiersName;
  bool? isDefault;
  int? upgradePoint;
  int? upgradeTimeLimit;
  String? shortDescription;
  String? colorCode;
  String? image;
  String? createdAt;
  String? updatedAt;

  MembershipTier(
      {this.id,
        this.tiersName,
        this.isDefault,
        this.upgradePoint,
        this.upgradeTimeLimit,
        this.shortDescription,
        this.colorCode,
        this.image,
        this.createdAt,
        this.updatedAt});

  MembershipTier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tiersName = json['tiers_name'];
    isDefault = json['is_default'];
    upgradePoint = json['upgrade_point'];
    upgradeTimeLimit = json['upgrade_time_limit'];
    shortDescription = json['short_description'];
    colorCode = json['color_code'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tiers_name'] = this.tiersName;
    data['is_default'] = this.isDefault;
    data['upgrade_point'] = this.upgradePoint;
    data['upgrade_time_limit'] = this.upgradeTimeLimit;
    data['short_description'] = this.shortDescription;
    data['color_code'] = this.colorCode;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
