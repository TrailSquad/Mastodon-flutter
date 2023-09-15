class Message {
  final String name;
  final String domain;
  final String message;
  final String time;
  final String avatarUrl;

  Message({
    required this.name,
    required this.domain,
    required this.message,
    required this.time,
    required this.avatarUrl,
  });
}

extension MessageExtension on Message {
  static List<Message> get dummyMessages =>
      [
        Message(
          name: "Enno Park",
          domain: "@ennopark@mastodon.com",
          message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget ultricies aliquam, nisl nisl ultricies nisl, eget ultricies nisl nisl eget nisl.",
          time: "1h",
          avatarUrl: "https://placebear.com/g/200/200",
        ),
        Message(
          name: "Enno Park Two",
          domain: "@ennopark@mastodon.com",
          message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget ultricies aliquam, nisl nisl ultricies nisl, eget ultricies nisl nisl eget nisl.",
          time: "1h",
          avatarUrl: "https://placebear.com/g/200/200",
        ),
        Message(
          name: "Enno Park Three",
          domain: "@ennopark@mastodon.com",
          message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget ultricies aliquam, nisl nisl ultricies nisl, eget ultricies nisl nisl eget nisl.",
          time: "1h",
          avatarUrl: "https://placebear.com/g/200/200",
        )
      ];

}