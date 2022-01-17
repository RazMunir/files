import 'package:flutter/material.dart';

void main() {

  Widget createWidgetForTesting({Widget child}){
    return MaterialApp(
      home: child,
    );
  }

  // testWidgets('Login Page smoke test', (WidgetTester tester) async {
  //
  //   await tester.pumpWidget(createWidgetForTesting(child: new LoginPage()));
  //
  //   await tester.pumpAndSettle();

  // });
}

const TEXT_NORMAL = 16.0;
const TEXT_LARGE = 22.0;
const TEXT_SMALL = 10.0;

const FLUTTER_OPEN = 'Flutter Open';

const YELLOW = Color(0xfffbed96);
const BLUE = Color(0xffabecd6);
const BLUE_DEEP = Color(0xffA8CBFD);
const BLUE_LIGHT = Color(0xffAED3EA);
const PURPLE = Color(0xffccc3fc);
const RED = Color(0xffF2A7B3);
const GREEN = Color(0xffc7e5b4);
const RED_LIGHT = Color(0xffFFC3A0);
const TEXT_BLACK = Color(0xFF353535);
const TEXT_BLACK_LIGHT = Color(0xFF34323D);

const IMAGE_PATH = "assets/images";

class PageImage {
  static const FLUTTER_OPEN = "$IMAGE_PATH/ic_launcher.png";
  static const PIC_01 = "$IMAGE_PATH/image/pic01.png";
}

class PageName {
  static const CONTAINER = "Contanter";
  static const TEXT = "Text";
  static const IMAGE = "Image";
  static const ROW_COLUMN = "Row & Column";
  static const ICON = "Icon";
  static const RAISE_BUTTON = "RaiseButton";
  static const APP_BAR = "AppBar";
  static const SCAFFOLD = "Scaffold";
  static const FLUTTER_LOGO = "FlutterLogo";
  static const PLACE_HOLDER = "PlaceHolder";
  static const BOTTOM_NAV_BAR = "BottomNavigationBar";
  static const TAB_VIEW = "TabView";
  static const FLOATING_ACTION_BUTTON = "FloatingActionButton";
  static const DROP_DOWN_BUTTON = "DropDownButton";
  static const POPUP_MENU_BUTTON = "PopupMenuButton";
  static const STACK = "Stack";
  static const STEPPER = "Stepper";
  static const SIMPLE_DIALOG = "SimpleDialog";
  static const ALERT_DIALOG = "AlertDialog";
  static const BOTTOM_SHEET = "BottomSheet";
  static const EXPANSION_PANEL = "ExpansionPanel";
  static const SNACK_BAR = "SnackBar";
  static const TEXT_FIELD = "TextField";
  static const CHIP = "Chip";
  static const SLIDER = "SLIDE";
  static const CHECK_BOX = "CheckBox";
  static const CARD = "CARD";
  static const TOOLTIP = "Tooltip";
  static const DATA_TABLE = "DataTable";
  static const PROGRESS_INDICATOR = "ProgressIndicator";
  static const MIX_SINGLE_LAYOUT = "MixLayout";
  static const INDEX_STACK = "IndexedStack";
  static const EXPANDED = "Expanded";
  static const FLOW = "Flow";
  static const LAYOUT = "Layout";
  static const METHOD_CHANNEL = "MethodChannel";
  static const ASSET_PAGE = "AssetsPage";
  static const ANIMATION = "AnimationPage";
  static const ANIM_CONTAINER = "AnimationContainer";
  static const ANIM_CROSS_FADE = "AnimationCrossFade";
  static const ANIM_HERO = "HeroPage";
  static const ANIM_FADE_TRANS = "FadeTranstion";
  static const ANIM_POSITION_TRANS = "PositionTransition";
  static const ANIM_ROTATION = "RotationTransition";
  static const ANIM_DEFAULT_TEXT = "DefaultText";
  static const ANIM_LIST = "AnimationList";
  static const ANIM_MODAL_BARRIER = "AnimatedModalBarrier";
  static const ANIM_SIZE = "AnimatedSize";
  static const ANIM_WIDGET = "AnimatedWidget";
  static const ANIM_PYH_MODEL = "PyhModel";
  static const ANIM_OPACITY = "OpacityPage";
  static const INTER_DRAG = "Draggable";
  static const INTER_GESTURE = "Gesture";
  static const INTER_DISMISSIBLE = "Dismissible";
  static const INTER_POINTER = "AbsorbPointer";
  static const INTER_SCROLLABLE = "Scrollable";
  static const INTER_NAV = "Navigator";
  static const ASYNC_FUTURE = "FutureBuilder";
  static const ASYNC_STREAM_BUILDER = "StreamBuilder";
  static const PAINT_OPACITY = "Opacity";
}

const PAGE_ITEMS = [
  {
    "title": PageName.CONTAINER,
    "img": PageImage.FLUTTER_OPEN,
    "click": PageName.CONTAINER,
  },
];

class DropDownButtonPage extends StatefulWidget {
  @override
  DropDownButtonState createState() => DropDownButtonState();
}

class DropDownButtonState extends State<DropDownButtonPage> {
  var _value = "1";

  DropdownButton _normalDown() => DropdownButton<String>(
    items: [
      DropdownMenuItem<String>(
        value: "1",
        child: Text(
          "First",
        ),
      ),
      DropdownMenuItem<String>(
        value: "2",
        child: Text(
          "Second",
        ),
      ),
    ],
    onChanged: (value) {
      setState(() {
        _value = value;
      });
    },
    value: _value,
  );

  DropdownButton _itemDown() => DropdownButton<String>(
    items: [
      DropdownMenuItem(
        value: "1",
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.build),
            SizedBox(width: 10),
            Text(
              "build",
            ),
          ],
        ),
      ),
      DropdownMenuItem(
        value: "2",
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.settings),
            SizedBox(width: 10),
            Text(
              "Setting",
            ),
          ],
        ),
      ),
    ],
    onChanged: (value) {
      setState(() {
        _value = value;
      });
    },
    value: _value,
    isExpanded: true,
  );

  DropdownButton _hintDown() => DropdownButton<String>(
    items: [
      DropdownMenuItem<String>(
        value: "1",
        child: Text(
          "First",
        ),
      ),
      DropdownMenuItem<String>(
        value: "2",
        child: Text(
          "Second",
        ),
      ),
    ],
    onChanged: (value) {
      print("value: $value");
    },
    hint: Text(
      "Please select the number!",
      style: TextStyle(
        color: TEXT_BLACK,
      ),
    ),
  );

  DropdownButton _hint2Down() => DropdownButton<String>(
    items: null,
    onChanged: null,
    disabledHint: Text("You can't select anything."),
  );

  DropdownButton _normal2Down() => DropdownButton<String>(
    items: [
      DropdownMenuItem<String>(
        value: "1",
        child: Text(
          "First",
        ),
      ),
      DropdownMenuItem<String>(
        value: "2",
        child: Text(
          "Second",
        ),
      ),
    ],
    onChanged: (value) {
      setState(() {
        _value = value;
      });
    },
    value: _value,
    elevation: 2,
    style: TextStyle(color: PURPLE, fontSize: 30),
    isDense: true,
    iconSize: 40.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PageName.DROP_DOWN_BUTTON),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //our code.
            Container(
              color: RED,
              child: _normalDown(),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: BLUE,
              child: _itemDown(),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: YELLOW,
              child: _hintDown(),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: GREEN,
              child: _hint2Down(),
            ),
            SizedBox(height: 10),
            Container(
              color: RED,
              alignment: Alignment.topRight,
              child: _normal2Down(),
            ),
            SizedBox(height: 600)
          ],
        ),
      ),
    );
  }
}