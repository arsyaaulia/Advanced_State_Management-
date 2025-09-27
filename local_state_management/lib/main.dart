import 'package:flutter/material.dart'; 

void main() => runApp(
  localStateApp()
); 

class localStateApp extends StatelessWidget { 
  @override Widget build(BuildContext context) { 
    return MaterialApp( 
      home: Scaffold( 
        appBar: AppBar(
          title: Text('Local State Management')
        ), 
        body: CounterWidget(), 
      ), 
    ); 
  } 
} 

class CounterWidget extends StatefulWidget { 
  @override _CounterWidgetState createState() => _CounterWidgetState(); 
} 

class _CounterWidgetState extends State<CounterWidget> { 
  int _counter = 0; 

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }


  void _decrementCounter(){
    setState(() {
      if (_counter > 0){
        _counter--;
      } 
      // Tambahakn notif
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Nilai counter tidak boleh kurang dari 0'),
            duration: Duration(seconds: 10)
          )
        );
      }
      
    });
  }
  
  @override Widget build(BuildContext context) { 
    return Center( 
      child: Column( 
        mainAxisAlignment: MainAxisAlignment.center, 
        children: <Widget>[ 
          Text('Counter Value: $_counter'), 
          SizedBox(height: 10), 

          ElevatedButton( 
            onPressed: _incrementCounter,
            child: Text('Increment'), 
          ), 
          SizedBox(height: 10), 

          ElevatedButton( 
            onPressed: _decrementCounter,
            child: Text('Decrement'), 
          ), 
        ], 
      ), 
    ); 
  } 
}