class SettingsData {
  bool closeOnRun;
  bool closeOnOpen;

  SettingsData(this.closeOnOpen, this.closeOnRun);

  SettingsData.fromJson(Map<String, dynamic> json)
      : closeOnOpen = json['coo'],
        closeOnRun = json['cor'];

  Map<String, dynamic> toJson() => {'coo': closeOnOpen, 'cor': closeOnRun};
}
