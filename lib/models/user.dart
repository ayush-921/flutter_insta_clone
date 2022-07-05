class User {
  final String uid;
  final String email;
  final String bio;
  final String photoUrl;
  final String username;
  final List followers;
  final List following;
  User({
    required this.bio,
    required this.email,
    required this.followers,
    required this.following,
    required this.photoUrl,
    required this.uid,
    required this.username,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'followers': followers,
        'following': following,
        'bio': bio,
        'username': username,
        'photoUrl': photoUrl,
      };
}
