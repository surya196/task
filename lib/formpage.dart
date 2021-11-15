import 'package:flutter/material.dart';

class Formpage extends StatefulWidget {
  const Formpage({Key? key}) : super(key: key);

  @override
  _FormpageState createState() => _FormpageState();
}

class _FormpageState extends State<Formpage> {
  final datecontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
                validator: (v) {
                  if (v!.valname) {
                    return null;
                  } else {
                    return 'enter valid name';
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Date of birth',
                ),
                readOnly: true,
                controller: datecontroller,
                onTap: () async {
                  var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100));
                  datecontroller.text = date.toString().substring(0, 10);
                },
              ),
              emailvald(),
              phonevald(),
              ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      // ignore: deprecated_member_use
                      Scaffold.of(context).showSnackBar(
                          const SnackBar(content: Text('submitted')));
                    }
                  },
                  child: const Text('submit'))
            ],
          ),
        ),
      )),
    );
  }
}

Widget emailvald() {
  return TextFormField(
    decoration: const InputDecoration(
      hintText: 'Email',
    ),
    validator: (v) {
      if (v!.valemail) {
        return null;
      } else {
        return 'enter valid email';
      }
    },
  );
}

Widget phonevald() {
  return TextFormField(
    decoration: const InputDecoration(
      hintText: 'Phone number',
    ),
    validator: (v) {
      if (v!.phoneval) {
        return null;
      } else {
        return 'enter valid phone number';
      }
    },
  );
}

Widget empid() {
  return TextFormField(
    decoration: const InputDecoration(
      hintText: 'EmpId',
    ),
  );
}

Widget addres() {
  return TextFormField(
    decoration: const InputDecoration(
      hintText: 'Address',
    ),
    maxLines: 4,
  );
}

extension Exstring on String {
  bool get valname {
    final namereg = RegExp(r"^\s*([A-Za-z]{1,}([\.,]|[-']|))+[A-Za-z]+\.?\s*$");
    return namereg.hasMatch(this);
  }

  bool get valemail {
    final emailreg = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailreg.hasMatch(this);
  }

  bool get phoneval {
    final phone = RegExp(r'^\+?0[0-9]{10}$');
    return phone.hasMatch(this);
  }
}
