class Program {
  String name, desc, path;

  Program(this.name, this.desc, this.path);

  Program.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        desc = json['desc'],
        path = json['path'];

  Map<String, dynamic> toJson() => {'name': name, 'desc': desc, 'path': path};
}
