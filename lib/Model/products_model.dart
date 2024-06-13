class ProductModel {
  List<Events>? events;

  ProductModel({this.events});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
  String? id;
  String? name;
  String? description;
  int? seats;
  String? startTime;
  String? endTime;
  String? startDate;
  String? endDate;
  Ticket? ticket;
  List<Passes>? passes;

  Events(
      {this.id,
      this.name,
      this.description,
      this.seats,
      this.startTime,
      this.endTime,
      this.startDate,
      this.endDate,
      this.ticket,
      this.passes});

  Events.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    seats = json['seats'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    ticket =
        json['ticket'] != null ? new Ticket.fromJson(json['ticket']) : null;
    if (json['passes'] != null) {
      passes = <Passes>[];
      json['passes'].forEach((v) {
        passes!.add(new Passes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['seats'] = this.seats;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    if (this.ticket != null) {
      data['ticket'] = this.ticket!.toJson();
    }
    if (this.passes != null) {
      data['passes'] = this.passes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ticket {
  String? id;
  int? price;

  Ticket({this.id, this.price});

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    return data;
  }
}

class Passes {
  String? id;
  int? price;
  int? validDays;

  Passes({this.id, this.price, this.validDays});

  Passes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    validDays = json['valid_days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['valid_days'] = this.validDays;
    return data;
  }
}
