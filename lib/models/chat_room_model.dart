class ChatRoomModel {
  final String newRoom;
  final String roomName;
  final String roomId;

  ChatRoomModel({
    required this.newRoom,
    required this.roomName,
    required this.roomId,
  });

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) {
    return ChatRoomModel(
      newRoom: json['NewRoom'],
      roomName: json['RoomName'], // ده الاسم اللي عند الـ backend
      roomId: json['RoomId'],
    );
  }
}

class Message {
  final String messageId;
  final String messageText;

  Message({required this.messageId, required this.messageText});
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      messageId: json['MessageId'],
      messageText: json['MessageText'],
    );
  }
}
