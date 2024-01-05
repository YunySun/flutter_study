/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2023-11-20 14:51:01
 * @LastEditors: 虾饺
 * @LastEditTime: 2023-12-05 16:45:30
 * @Profile: 一个比较废柴的前端开发
 */
import 'package:flutter/material.dart';
// https://pub.dev/packages/google_fonts
// 谷歌字体需要设备/模拟器上的互联网连接 需要爬梯子
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /** ThemeData 用于配置整个应用程序的外观
       * @param colorScheme
       * @param textTheme
       */
      theme: ThemeData(
        useMaterial3: true, // Material3是flutter的默认主题
        // 定义默认亮度和颜色
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
        // 定义默认文字样式
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.oswald(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      title: 'Flutter 学习',
      home: MyHomePage(title: '使用Themes统一颜色和字体风格'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onSecondary, // 当前主题中的次要（secondary）色调上的文本颜色
              ),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          // Theme.of(context)会查询Widget树，并返回最近的Theme，如果找不到会返回全局的主题
          color: Theme.of(context).colorScheme.primary,
          child: Text(
            '拥有背景色的文案',
            /**Theme.of(context).textTheme返回当前主题中与文本相关样式集合
               * @params bodyMedium表示正文文本的中等粗细样式
               * @params copyWith()允许创建一个新的文本样式 改样式与现有样式相同 但其中的属性被覆盖
               * @param color 颜色设置为Theme.of(context).colorScheme.onPrimary 当前主题中的主色调
               */
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        ),
        // ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        // ),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
