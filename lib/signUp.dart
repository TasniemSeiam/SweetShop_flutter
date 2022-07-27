import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool visiable= true;

  // TextEditingController phoneController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Login", style:TextStyle(
            fontSize: 25.0, fontWeight: FontWeight.bold ,
          ) ,
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(

            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.phone),

            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(

            keyboardType: TextInputType.visiblePassword,
            obscureText: visiable,
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
              suffixIcon:
              IconButton(icon:visiable==true? Icon(Icons.visibility):Icon(Icons.visibility_off),
                onPressed: (){
                  visiable=!visiable;
                  setState(() {

                  });
                }, ),
            ),
          ),
          SizedBox(
            height: 30,
          ),

          Container(
            width: 200,
            decoration: BoxDecoration(
              color: Colors.pink[300],
              borderRadius:BorderRadius.circular(10),
            ),
            child: MaterialButton(onPressed: ()
            { },
              child: Text("Login",style: TextStyle(
                color: Color(0xffefffff),
                fontSize: 20,
              ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text("Don't have an account"), TextButton(onPressed: (){}, child:Text("Sign up"))
            ],
          ),



        ],
      ),
    );
  }
}
