import 'package:flutter/material.dart';

class DashboardButtonWidget extends StatelessWidget {
  final Function onClick;
  final String _buttonName;
  final IconData _icon;

  DashboardButtonWidget(this._buttonName, this._icon,
      {Key key, @required this.onClick})
      : assert(_icon != null),
        assert(onClick != null);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        onTap: () {
          onClick();
        },
        child: Container(
          padding: EdgeInsets.all(8),
          height: 100,
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                _icon,
                color: Colors.white,
                size: 24.0,
              ),
              Text(
                _buttonName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
