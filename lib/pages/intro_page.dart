import 'package:e_commerce_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21.0),
            child: Column(
              children: [
                //logo
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(child: Image.asset("lib/img/logo.png", height: 60)),
                ),
          
                SizedBox(height: 20),
          
                //title
                Text(
                  "Гарантия Уверенность Успех",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
          
                SizedBox(height: 24),
          
                //sub title
                Text(
                  "Концепт приложения для библиотечной инфраструктуры Государственного университета управления",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
          
                SizedBox(height: 48),
                //TextField for user's data
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Введите ФИО",
                  ),
                ),

                SizedBox(height: 15,),

                //TextField for write bilet
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Введите номер читательского билета",
                  ),
                ),
          
                SizedBox(height: 15),
          
                //Start Button
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                   
                      child: const Text(
                        "Войти",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
