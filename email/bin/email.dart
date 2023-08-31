import 'package:email/email.dart' as email;

Iterable<EmailAddress> parseEmailAddresses(Iterable<String> strings) {
  return strings.map((string) => EmailAddress(string));
}

bool anyInvalidEmailAddress(Iterable<EmailAddress> emails) {
  return emails.any((email) => !isValidEmailAddress(email));
}

bool isValidEmailAddress(EmailAddress email) {
  return email.address.contains('@');
}

Iterable<EmailAddress> validEmailAddresses(Iterable<EmailAddress> emails) {
  return emails.where((email) => isValidEmailAddress(email));
}

class EmailAddress {
  final String address;

  EmailAddress(this.address);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is EmailAddress &&
              address == other.address;

  @override
  int get hashCode => address.hashCode;

  @override
  String toString() {
    return 'EmailAddress{address: $address}';
  }
}

void main(List<String> arguments) {
  Iterable<String> emailList = ["kimsyd@hawaii.edu", "skim@hawaii.edu", "sydneyk"];

  Iterable<EmailAddress> verifiedEmails = parseEmailAddresses(emailList);
  print("All input addresses:");
  print(verifiedEmails);

  if (anyInvalidEmailAddress(verifiedEmails) == true) {
    print("\nInvalid email found. Cleaning.");
    verifiedEmails = validEmailAddresses(verifiedEmails);
    print("Valid email addresses: $verifiedEmails");
  }
  else {
    print("\nNo invalid email found.");
    print("Valid email addresses: $verifiedEmails");
  }
}
