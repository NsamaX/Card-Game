class menu {
  final List<dynamic> _menu = [
    null,
    'Setting',
    null,
  ];

  final List<Function> _onTap = [
    () {},
    () {},
    () {},
  ];

  List<dynamic> getMenu() {
    return _menu;
  }

  List<Function> getOnTap() {
    return _onTap;
  }
}
