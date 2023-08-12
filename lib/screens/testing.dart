import 'package:flutter/material.dart';
import 'package:khetikhata/colors/colors_const.dart';
import 'package:khetikhata/const/constContainer.dart';

class RadioContainerWidget extends StatefulWidget {
  const RadioContainerWidget({ Key ?key}) : super(key: key);
  @override
  State<RadioContainerWidget> createState() => _RadioContainerWidgetState();
}
class _RadioContainerWidgetState extends State<RadioContainerWidget> {
  int value = 0;
  Widget CustomRadioButton(String text, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            value = index;
          });
        },
        child: ConstantContainer(
          height: 20,
          width:MediaQuery.of(context).size.width*.15 ,
          radiusBorder: 20,
          color: (value==index)?AppColors.primary60:AppColors.white,
          borderColor: AppColors.white50,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: (value == index) ? AppColors.white : AppColors.white100,
              ),
            ),
          ),
        )


      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CustomRadioButton("Single", 1),
        CustomRadioButton("Married", 2),
        CustomRadioButton("Other", 3)
      ],
    );
  }
}


//OutlinedButton.styleFrom(
//           minimumSize: Size(MediaQuery.of(context).size.width*.15, 20),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           side: BorderSide(color: (value == index) ? Colors.green : Colors.black),
//         ),