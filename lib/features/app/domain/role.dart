enum Role {
  head,
  member,
  unknown;

  static Role getRole(String role) {
    switch (role.toLowerCase()) {
      case 'member':
        return member;
      case 'head':
        return head;
      default:
        return unknown;
    }
  }
}
