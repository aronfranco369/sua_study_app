// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:study_app/Auth/signup2.dart';
import 'package:study_app/mindex.dart';

class Signup1 extends StatefulWidget {
  const Signup1({super.key});

  @override
  State<Signup1> createState() => _Signup1State();
}

class _Signup1State extends State<Signup1> {
  bool _loading = false;
  bool _passenable = false;
  final _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _password = TextEditingController();
  final _phonenum = TextEditingController();
  final _username = TextEditingController();
  final _regNo = TextEditingController();
  AutovalidateMode? autovalidateMode;

  Future submit() async {
    setState(() {
      autovalidateMode = AutovalidateMode.onUserInteraction;
    });
    if (_formKey.currentState!.validate()) {
      setState(() {
        _loading = true;
      });

      Signup2(
        email: _email.text,
        password: _password.text,
        phonenum: _phonenum.text,
        username: _username.text,
        regNo: _regNo.text,
      ).launch(context);
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return AuthConstantWidget(
            authWidget: Form(
          autovalidateMode: autovalidateMode,
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('New\nAccount', style: boldTextStyle(color: white, size: 25)),
                  Container(
                    height: 80,
                    width: 80,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.add_a_photo_outlined, color: grey),
                        8.height,
                        Text('Upload', style: secondaryTextStyle(color: grey)),
                      ],
                    ),
                  )
                ],
              ),
              16.height,
              TextFormField(
                onChanged: (newValue) {
                  ref.read(signupDataProvider.notifier).updateRegNo(newValue);
                },
                controller: _regNo,
                style: primaryTextStyle(color: white),
                cursorColor: white,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: buildSHInputDecoration(
                  'Registration Number ',
                  textColor: Colors.grey,
                ),
                validator: (value) {
                  RegExp regex = RegExp(r'^[A-Z]{3}/[DE]/\d{4}/\d{4}$');

                  if (value!.isEmpty) {
                    return ("Registration number cannot be Empty");
                  }
                  if (!regex.hasMatch(value)) {
                    return ("Invalid format of registration number \n eg FST/D/2020/0028");
                  }
                  return null;
                },
                // validator: (value) => EmailValidator.validate(value!) ? null : "Please enter a valid email",
              ),
              16.height,
              TextFormField(
                onChanged: (newValue) {
                  ref.read(signupDataProvider.notifier).updateEmail(newValue);
                },
                controller: _email,
                style: primaryTextStyle(color: white),
                cursorColor: white,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: buildSHInputDecoration(
                  'Email',
                  textColor: Colors.grey,
                ),
                // validator: (value) => EmailValidator.validate(value!) ? null : "Please enter a valid email",
                validator: (value) {
                  RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                  if (value!.isEmpty) {
                    return ("Email adress cannot be Empty");
                  }
                  if (!regex.hasMatch(value)) {
                    return ("Invalid format of an email adress \n eg studyhub@gmail.com");
                  }
                  return null;
                },
              ),
              16.height,
              TextFormField(
                onChanged: (value) {
                  ref.read(signupDataProvider.notifier).updatephonenum(value);
                },
                controller: _phonenum,
                style: primaryTextStyle(color: white),
                cursorColor: white,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: buildSHInputDecoration(
                  'Phone number',
                  textColor: Colors.grey,
                ),
                validator: (value) {
                  RegExp regex = RegExp(r'(^(?:[+0]9)?[0-9]{10}$)');
                  if (value!.isEmpty) {
                    return ("Mobile number cannot be Empty");
                  }
                  if (!regex.hasMatch(value)) {
                    return ("Enter Valid Number with minimum 10 Character\n eg 0682993140");
                  }
                  return null;
                },
                onSaved: (value) {
                  _phonenum.text = value!;
                },
              ),
              16.height,
              TextFormField(
                  onChanged: (newValue) {
                    ref.read(signupDataProvider.notifier).updateUsername(newValue);
                  },
                  controller: _username,
                  style: primaryTextStyle(color: white),
                  cursorColor: white,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: buildSHInputDecoration(
                    'Username',
                    textColor: Colors.grey,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Username cannot be Empty");
                    }
                    return null;
                  }),
              16.height,
              TextFormField(
                controller: _password,
                style: primaryTextStyle(color: white),
                cursorColor: white,
                obscureText: _passenable,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                decoration: buildSHInputDecoration(
                  'Password',
                  textColor: Colors.grey,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _passenable = !_passenable;
                      });
                    },
                    child: Icon(
                      _passenable ? Icons.visibility_off : Icons.visibility,
                      color: white,
                    ),
                  ),
                ),
                validator: (value) {
                  RegExp regex = RegExp(r'^.{6,}$');
                  if (value!.isEmpty) {
                    return ("Password cannot be Empty");
                  }
                  if (!regex.hasMatch(value)) {
                    return ("Enter Valid Password(Min. 6 Character)");
                  }
                  return null;
                },
                onSaved: (value) {
                  _password.text = value!;
                },
              ),
              32.height,
              customButton(
                context: context,
                isLoading: _loading, // Pass the loading state here
                textColor: white,
                text: 'Next',
                onTap: () {
                  submit();
                },
              ),
            ],
          ),
        ));
      },
    );
  }
}
