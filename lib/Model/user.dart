class Users{
  String checkIdentity;//신분(선생님, 학생)
  String name;
  int RegisdentNumber;//주민번호
  int ResidentBackNumber;//주민번호 뒷자리 한개
  int ID;
  int PhoneNumber;//폰넘버
  //int PhoneVerify;//인증번호
  int Password;//비밀번호

  Users(
      this.checkIdentity,
      this.name,
      this.RegisdentNumber,
      this.ResidentBackNumber,
      this.ID,
      this.PhoneNumber,
      //this.PhoneVerify,
      this.Password
      );
}