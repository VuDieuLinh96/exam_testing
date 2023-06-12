class TextFieldValidate{
  static String? validateEmail({String? value}){
    if(value == null) return "Please enter Email";
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
     if(!regex.hasMatch(value)){
       return "Enter valid Email";
     }
    return null;
  }

  static String? validatePassword({String? value}){
    if(value == null) return "Please enter Password";

    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);

    if(!regExp.hasMatch(value)){
      return "Enter valid Password";
    }

    if(value.length < 6){
      return "Enter valid Password";
    }
    return null;
  }
}