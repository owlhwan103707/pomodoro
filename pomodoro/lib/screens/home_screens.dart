import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  static const twentyFiveMinutes = 1500 ;
  int totalSeconds = twentyFiveMinutes; //시간 체크
  bool isRunning = false; //시간 멈추기
  int totalPomodoros = 0;
  late Timer timer;

  void onTick(Timer timer) //타이머 함수
  {
    if(totalSeconds == 0)
    {
      setState(() {
        totalPomodoros += 1;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
      });
      timer.cancel();
    }
    else
    {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed()//버튼 누를 때 시간함수
  {
    timer = Timer.periodic(Duration(seconds: 1),onTick,);
    setState(() {
      isRunning = true;
    });

  }

  void onPausePressed()//멈출때 함수
  {
    timer.cancel();
    setState(() {
      isRunning = false;
    });


  }
  void onRestartPressed()
  {
    timer.cancel();//타이머가 더 실행되지 않도록 실행

    setState(() {

      totalSeconds = twentyFiveMinutes;
      isRunning = false;
    });


  }

  String format(int seconds)
  {
    var duration = Duration(seconds: seconds);

    return duration.toString().split(".").first.substring(2,7);//문자열 자르기
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(flex:1, child: Container(
            alignment: Alignment.bottomCenter,
            child: Text(format(totalSeconds),style: TextStyle(
              color: Theme.of(context).cardColor,fontSize: 89,fontWeight: FontWeight.w600,),),

          )),
          Flexible(flex:3, child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onPausePressed : onStartPressed  ,
                    icon: Icon(isRunning ? Icons.pause_circle_outline : Icons.play_circle_outline)
                ),
                IconButton(
                  iconSize: 98,
                  color: Theme.of(context).cardColor,
                  onPressed: onRestartPressed,
                  icon: Icon(Icons.restart_alt_sharp),)
              ],
            ),//시작 버튼

          ),


          ),
          Flexible(flex:1, child: Row(
            children: [
              Expanded( //확장기능
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).cardColor,borderRadius: BorderRadius.circular(50),),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('pomodoro',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Theme.of(context).textTheme.displayLarge!.color),),
                      Text('$totalPomodoros',style: TextStyle(fontSize: 58,fontWeight: FontWeight.w600,color: Theme.of(context).textTheme.displayLarge!.color),),
                    ],
                  ),
                ),
              ),
            ],
          )),


        ],
      ),



    );
  }
}



