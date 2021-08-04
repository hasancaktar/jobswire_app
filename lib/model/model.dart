class JobSwireModel {
  String? slug;
  String? id;
  String? epoch;
  String? date;
  String? company;
  String? companyLogo;
  String? position;
  String? tags;
  String? logo;
  String? description;
  String? location;
  String? url;
  String? applyUrl;

  JobSwireModel({
    this.slug,
    this.id,
    this.epoch,
     this.date,
     this.company,
    this.companyLogo,
     this.position,
     this.tags,
     this.logo,
     this.description,
     this.location,
    this.url,
    this.applyUrl,
  });

  factory JobSwireModel.fromJson(Map<String, dynamic> json) => JobSwireModel(
        slug: json["slug"],
        id: json["id"],
        epoch: json["epoch"],
        date: json["date"],
        company: json["company"],
        companyLogo: json["companyLogo"],
        position: json["position"],
        tags: json["tags"].join(", "),
        logo: json["logo"],
        description: json["description"],
        location: json["location"],
        url: json["url"],
        applyUrl: json["applyUrl"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "id": id,
        "epoch": epoch,
        "date": date,
        "company": company,
        "companyLogo": companyLogo,
        "position": position,
        "tags": tags,
        "logo": logo,
        "description": description,
        "location": location,
        "url": url,
        "applyUrl": applyUrl,
      };
}
