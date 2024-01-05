/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2023-12-20 16:38:17
 * @LastEditors: 虾饺
 * @LastEditTime: 2023-12-26 17:03:34
 * @Profile: 一个比较废柴的前端开发
 */
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录页面'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '欢迎',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: '用户名',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: '密码',
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.push('/catalog');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                  ),
                  child: const Text('登录'))
            ],
          ),
        ),
      ),
    );
  }
}
