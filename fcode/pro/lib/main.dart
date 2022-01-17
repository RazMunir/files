import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_app/example/bm/bm_main.dart';
import 'package:flutter_profile_app/example/datatable_sortable/datatable_main.dart';
import 'package:flutter_profile_app/example/drawer/drawer_main.dart';
import 'package:flutter_profile_app/example/flight_booking/flight_search_page.dart';
import 'package:flutter_profile_app/example/flipcart/main.dart';
import 'package:flutter_profile_app/example/form/validation.dart';
import 'package:flutter_profile_app/example/pms/pms_main.dart';
import 'package:flutter_profile_app/example/rounded_design/home_page.dart';
import 'package:flutter_profile_app/example/scale_size/scale_size_page.dart';
import 'package:flutter_profile_app/example/silver_appbar_fab/silver_appbar_fab.dart';
import 'package:flutter_profile_app/example/soft_ui/player_page.dart';
import 'package:flutter_profile_app/example/whatsapp_clone/whatsapp_main.dart';
import 'package:flutter_profile_app/example/wm/wm_main.dart';
import 'package:flutter_profile_app/practice_v10/aspect_ratio_test.dart';
import 'package:flutter_profile_app/practice_v10/date_time_test.dart';
import 'package:flutter_profile_app/practice_v10/date_time_to_show_img.dart';
import 'package:flutter_profile_app/practice_v10/layout_builder_test.dart';
import 'package:flutter_profile_app/practice_v10/media_query_test.dart';
import 'package:flutter_profile_app/practice_v10/page_view_test.dart';
import 'package:flutter_profile_app/practice_v10/time_line_test.dart';
import 'package:flutter_profile_app/practice_v2/m_check_box.dart';
import 'package:flutter_profile_app/practice_v2/m_group_check_box.dart';
import 'package:flutter_profile_app/practice_v2/m_switch_button.dart';
import 'package:flutter_profile_app/practice_v2/m_text_field.dart';
import 'package:flutter_profile_app/practice_v3/m_container.dart';
import 'package:flutter_profile_app/practice_v3/m_date_picker.dart';
import 'package:flutter_profile_app/practice_v3/m_physical_model.dart';
import 'package:flutter_profile_app/practice_v3/row_column_v2.dart';
import 'package:flutter_profile_app/practice_v4/delay_thread.dart';
import 'package:flutter_profile_app/practice_v4/draggable_impl.dart';
import 'package:flutter_profile_app/practice_v4/draggable_v2.dart';
import 'package:flutter_profile_app/practice_v4/draggable_v3.dart';
import 'package:flutter_profile_app/practice_v4/rv_list_view_with_filter.dart';
import 'package:flutter_profile_app/practice_v4/rv_list_view_with_scroll_to_item.dart';
import 'package:flutter_profile_app/practice_v4/rv_list_view_with_top_bottom_detect.dart';
import 'package:flutter_profile_app/practice_v4/rv_list_view_with_top_bottom_detect_.dart';
import 'package:flutter_profile_app/practice_v4/rv_list_view_with_top_bottom_detect_v2.dart';
import 'package:flutter_profile_app/practice_v9/otp.dart';
import 'package:flutter_profile_app/practice_v9/otp_v2.dart';
import 'package:flutter_profile_app/practice_v9/otp_v3.dart';
import 'package:flutter_profile_app/screens/archive_chat/archive_chat.dart';
import 'package:flutter_profile_app/screens/audio_calling/dial_call.dart';
import 'package:flutter_profile_app/screens/audio_calling/group_call.dart';
import 'package:flutter_profile_app/screens/audio_calling/group_call_v2.dart';
import 'package:flutter_profile_app/screens/audio_calling/single_user_call.dart';
import 'package:flutter_profile_app/screens/audio_calling/single_video_call.dart';
import 'package:flutter_profile_app/screens/call_logs/call_log.dart';
import 'package:flutter_profile_app/screens/chat_screen.dart';
import 'package:flutter_profile_app/screens/chat_screen_dd_v2.dart';
import 'package:flutter_profile_app/screens/chat_screen_with_call_log.dart';
import 'package:flutter_profile_app/screens/contact/all_contact.dart';
import 'package:flutter_profile_app/screens/group_create/info.dart';
import 'package:flutter_profile_app/screens/group_create/add_member.dart';
import 'package:flutter_profile_app/screens/group_create/add_name.dart';
import 'package:flutter_profile_app/screens/group_profile/app_bar_custom.dart';
import 'package:flutter_profile_app/screens/login_system/forget_password_v2.dart';
import 'package:flutter_profile_app/screens/login_system/sign_in.dart';
import 'package:flutter_profile_app/screens/login_system/verification_code.dart';
import 'package:flutter_profile_app/screens/notification/notification.dart';
import 'package:flutter_profile_app/screens/notification/notification_v2.dart';
import 'package:flutter_profile_app/screens/personal_profile/personal_profile_complete.dart';
import 'package:flutter_profile_app/screens/settings/settings.dart';
import 'package:flutter_profile_app/screens/settings/settings_v2.dart';
import 'package:flutter_profile_app/screens/story/all_stories.dart';
import 'package:flutter_profile_app/screens/story/all_stories_v2.dart';
import 'package:flutter_profile_app/screens/welcome/welcome_screen.dart';
import 'package:flutter_profile_app/screens/whatsapp_chat.dart';

import 'example/login_ui/login_ui.dart';
// import 'package:flutter_profile_app/screens/personal_profile/app_bar_custom.dart';

// color: Color(color.elementAt(1).values.first)

String CHAT_SCREEN='/ChatScreen';
String MEDIA_QUERY='/MediaQueryTest';
String DATE_TIME='/DateTimeTest';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: DevicePreview.locale(context), // Add the locale here
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFF4F4F9),
        body: SafeArea(
          // top: true,
          child: GroupCallV2(),
        ),
      ),
      routes: {
        CHAT_SCREEN: (BuildContext context)=> ChatScreen(),
        MEDIA_QUERY: (BuildContext context) => MediaQueryTest(),
        DATE_TIME: (BuildContext context) => DateTimeTest()
      },
    );
  }
}
