class Users {
  final String fullName;
  final String phoneNumber;
  final String emailAddress;
  final String password;

  Users({
    required this.fullName,
    required this.phoneNumber,
    required this.emailAddress,
    required this.password,
  });

  // Constructor for sign in (only email and password needed0
  Users.signIn({required this.emailAddress, required this.password})
    : fullName = '',
      phoneNumber = '';

  // Convert User Object to Map (useful for API calls)
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'emailAddress': emailAddress,
      'password': password,
    };
  }

  // Create User object from Map (useful when receiving data from API)
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      emailAddress: json['emailAddress'],
      password: json['password'],
    );
  }

  // Copy with method for creating modified copies
  Users copyWith({
    String? fullName,
    String? phoneNumber,
    String? emailAddress,
    String? password,
  }) {
    return Users(
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return 'Users(fullName: $fullName, phoneNumber: $phoneNumber, emailAddress: $emailAddress, password: $password)';
  }
}

class AuthService {
  static Future<bool> signUp(Users user) async {
    print('Signing Up User: ${user.toString()}');

    await Future.delayed(const Duration(seconds: 2));

    return true;
  }

  static Future<bool> signIn(
    String emailAddress,
    String password,
    Users user,
  ) async {
    print('Signing in user with email: $emailAddress');

    await Future.delayed(const Duration(seconds: 2));

    return true;
  }
}
