import 'package:flutter/material.dart';
import 'items.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MainFrame extends StatefulWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  _MainFrameState createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {
  List<Map<String, dynamic>> _data = []; // Список данных

// Получение данных c сервера и сохранение их в переменной _data
  Future<void> getData() async {
    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body); // Декодирование данных из JSON
      setState(() {
        _data = List<Map<String, dynamic>>.from(jsonData); // Обновление состояния _data
      });
    } else {
      // Если запрос не удался
      print('Failed to fetch data');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();// Вызов метода для получения данных при инициализации состояния
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
      ),
      body: _data.isNotEmpty // Отображение списка элементов, если данные не пусты
          ? ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          final item = _data[index];
          return GestureDetector(
            child: Dismissible(
              key: Key(item['id'].toString()), // ключ для элемента списка
              onDismissed: (direction) {
                // Обработчик свайпа элемента
                setState(() {
                  _data.removeAt(index); // Удаление элемента из списка при его свайпе
                });
              },
              background: Container(
                color: Colors.red,
                child: const Center(
                  child: Text('Delete',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              child: Items(
                title: item["title"],
                userId: item["userId"],
                body: item["body"],
                id: item["id"],
              ),
            ),
          );
        },
      )
          : const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}