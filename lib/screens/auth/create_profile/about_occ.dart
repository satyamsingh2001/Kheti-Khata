import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../colors/colors_const.dart';
import '../../../const/constContainer.dart';
import '../../../styles/textstyle_const.dart';
import '../../../utils/Utils.dart';
import 'choose_group.dart';

class AboutOcc extends StatefulWidget {
  const AboutOcc({Key? key}) : super(key: key);

  @override
  State<AboutOcc> createState() => _AboutOccState();
}

class _AboutOccState extends State<AboutOcc> {
  bool _isClick = false;
  int _selectedOption = -1; // Initialize with no selection

  void _handleOptionSelected(int index) {
    setState(() {
      _selectedOption = index;
      _isClick = true;
    });
  }

  void _handleSubmit() {
    if (_isClick) {
      Utils.goTo(context, ChooseGroup());
    }
  }

  List<String> name =[
    "Mandi Trader",
    "Supplier",
    "Business",
    "Agri Professional",
    "Farmer",
  ];
  List<IconData> iconName =[
    Icons.add_business_sharp,
    Icons.add_business_sharp,
    Icons.business_center,
    CupertinoIcons.bag_fill,
    Icons.perm_identity_outlined,
    CupertinoIcons.tree,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white10,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white10,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Material(
              elevation: 5,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.white100,
                  )),
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: size.height / 7,
              ),
              Text(
                "What should we call you?",
                style: AppTextStyles.kBody20SemiboldTextStyle
                    .copyWith(color: AppColors.white100),
              ),
              const SizedBox(
                height: 25,
              ),
              ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                return CustomRadio(
                  index: index,
                  text: name[index],
                  icon: iconName[index],
                  isSelected: _selectedOption == 0,
                  onSelect: _handleOptionSelected,
                );
              }),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: _isClick ? _handleSubmit : null,
                child: ConstantContainer(
                  height: size.height * .05,
                  width: size.width / 2,
                  radiusBorder: 20,
                  borderColor: AppColors.white100,
                  color: _isClick ? AppColors.primary60 : AppColors.white50,
                  child: Center(
                      child: Text(
                    "Next",
                    style: AppTextStyles.kBody15SemiboldTextStyle
                        .copyWith(color: AppColors.white),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRadio extends StatelessWidget {
  final int index;
  final String text;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onSelect;

  CustomRadio(
      {Key? key,
      required this.index,
      required this.text,
      required this.icon,
      required this.isSelected,
      required this.onSelect})
      : super(key: key);

  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          onSelect(index);
        },
        child: ConstantContainer(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width / 1.2,
          radiusBorder: 30,
          color: AppColors.white,
          borderWidth: isSelected ? 1.5 : 1,
          borderColor: isSelected ? AppColors.primary60 : AppColors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: AppColors.primary60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: AppColors.white100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                !isSelected
                    ? const Icon(
                        Icons.circle_outlined,
                        color: AppColors.white100,
                      )
                    : const Icon(
                        Icons.check_circle_outline_outlined,
                        color: AppColors.primary60,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
