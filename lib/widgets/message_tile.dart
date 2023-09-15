import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_app/data/models/message.dart';

class MessageTile extends StatelessWidget {
  final Message message;

  const MessageTile({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(_Constants.paddingOneSide),
      child: Column(
        children: [
          MessageTileHeader(message: message),
          const Padding(padding: EdgeInsets.only(top: _Constants.paddingOneSide)),
          SizedBox(height: 50, child: Container(color: Colors.red)), // TODO: replace
          SizedBox(height: 10, child: Container(color: Colors.yellow)), // TODO: replace
        ],
      ),
    );
  }
}

class MessageTileHeader extends StatelessWidget {
  final Message message;

  const MessageTileHeader({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(_Constants.borderRadius),
          child: Image.network(message.avatarUrl,
            fit: BoxFit.fitWidth,
            width: _Constants.avatarWidthHeight,
            height: _Constants.avatarWidthHeight,
          ),
        ),
        const Padding(padding: EdgeInsets.only(left: _Constants.paddingOneSide)),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(right: _Constants.paddingOneSide),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(message.name),
                    const Padding(padding: EdgeInsets.only(left: _Constants.nameDomainPadding)),
                    Expanded(child: Text(message.domain, softWrap: false, maxLines: 1, overflow: TextOverflow.ellipsis,)),
                  ],
                ),
                Row(
                  children: [
                    Text(message.time),
                    const Icon(Icons.verified),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Icon(Icons.more_vert),
      ],
    );
  }
}

class _Constants {
  static const double paddingOneSide = 10;
  static const double borderRadius = 10;
  static const double avatarWidthHeight = 50;
  static const double nameDomainPadding = 6;
}