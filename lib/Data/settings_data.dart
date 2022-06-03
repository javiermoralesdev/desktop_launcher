class SettingsData {
  bool closeOnRun;

  SettingsData(this.closeOnRun);

  SettingsData.fromJson(Map<String, dynamic> json) : closeOnRun = json['cor'];

  Map<String, dynamic> toJson() => {'cor': closeOnRun};
}
