import 'package:flutter/material.dart';



//CheckBox and Validation=>Mandatory select option
class EditCheckBox extends StatefulWidget {

 @override
  _EditCheckBoxState createState() => _EditCheckBoxState();
}

class _EditCheckBoxState extends State<EditCheckBox> {

  bool checkedValue=false;

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (state){
       return Checkbox(
            value:checkedValue,
            onChanged: (value){
              setState((){
                checkedValue=value!;
                state.didChange(value);
              }
              );
            });
      },
      validator: (value){
        if (!checkedValue) {
          return '';
        } else {
          return null;
        }
      }
    );
  }
}



//Reference
/*
FormField<bool>(
builder: (state) {
return Column(
children: <Widget>[
Row(
children: <Widget>[
Checkbox(
value: checkboxValue,
onChanged: (value) {
setState(() {
//save checkbox value to variable that store terms and notify form that state changed
checkboxValue = value;
state.didChange(value);
});
}),
Text('I accept terms'),
],
),
//display error in matching theme
Text(
state.errorText ?? '',
style: TextStyle(
color: Theme.of(context).errorColor,
),
)
],
);
},
//output from validation will be displayed in state.errorText (above)
validator: (value) {
if (!checkboxValue) {
return 'You need to accept terms';
} else {
return null;
}
},
),
*/


//CheckBox => Optional selection Option
class CheckedBox extends StatefulWidget {
  const CheckedBox({Key? key}) : super(key: key);

  @override
  _CheckedBoxState createState() => _CheckedBoxState();
}

class _CheckedBoxState extends State<CheckedBox> {

  bool _value=false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value:_value ,
      onChanged: (newValue){
        setState(() {
          _value=newValue!;
        });
      },
    );
  }
}



//CheckBoxlistTile => can tap anywhere on th Checkboxlisttile
class EditCheckBoxTile extends StatefulWidget {

  late Widget title;
  EditCheckBoxTile({required this.title});

  @override
  _EditCheckBoxTileState createState() => _EditCheckBoxTileState();
}
class _EditCheckBoxTileState extends State<EditCheckBoxTile> {

  bool value=false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title:widget.title ,
        value: value,
        onChanged: (newValue){
          setState(() {
            value=newValue!;
          });
        },
      controlAffinity: ListTileControlAffinity.leading,
        );
  }
}

