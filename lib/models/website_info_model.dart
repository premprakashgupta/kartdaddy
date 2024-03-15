class WebsiteInfoModel {
  final int id;
  final String memberCode;
  final String name;
  final String businessName;
  final String websiteName;
  final String currentMobile;
  final String alternetMobile;
  final String currentEmail;
  final String alertnetEmail;
  final String headerLogo;
  final String footerLog;
  final String appLog;
  final String facebookLink;
  final String whatsAppLink;
  final String youtubeLink;
  final String instragramLink;
  final String linkedLink;
  final String twitterLink;
  final String aboutUs;
  final String adminWallet;
  final String status;
  final String privacyOtherDescription;
  final String updatedAt;

  WebsiteInfoModel({
    required this.id,
    required this.memberCode,
    required this.name,
    required this.businessName,
    required this.websiteName,
    required this.currentMobile,
    required this.alternetMobile,
    required this.currentEmail,
    required this.alertnetEmail,
    required this.headerLogo,
    required this.footerLog,
    required this.appLog,
    required this.facebookLink,
    required this.whatsAppLink,
    required this.youtubeLink,
    required this.instragramLink,
    required this.linkedLink,
    required this.twitterLink,
    required this.aboutUs,
    required this.adminWallet,
    required this.status,
    required this.privacyOtherDescription,
    required this.updatedAt,
  });

  factory WebsiteInfoModel.fromJson(Map<String, dynamic> json) {
    return WebsiteInfoModel(
      id: json['id'],
      memberCode: json['member_code'],
      name: json['name'],
      businessName: json['business_name'],
      websiteName: json['website_name'],
      currentMobile: json['current_mobile'],
      alternetMobile: json['alternet_mobile'],
      currentEmail: json['current_email'],
      alertnetEmail: json['alertnet_email'],
      headerLogo: json['header_logo'],
      footerLog: json['footer_log'],
      appLog: json['app_log'],
      facebookLink: json['facebook_link'],
      whatsAppLink: json['whats_app_link'],
      youtubeLink: json['youtube_link'],
      instragramLink: json['instragram_link'],
      linkedLink: json['linked_link'],
      twitterLink: json['twitter_link'],
      aboutUs: json['about_us'],
      adminWallet: json['admin_wallet'],
      status: json['status'],
      privacyOtherDescription: json['privacy_other_description'],
      updatedAt: json['updated_at'],
    );
  }
}
