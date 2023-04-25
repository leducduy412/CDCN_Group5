import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoa_lo_assistant/widgets/option_screen.dart';

class DetailScreen extends StatefulWidget {
  final String title;

  const DetailScreen({Key? key, required this.title}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarTop2(title: widget.title),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final maxHeight = constraints.maxHeight;
            final imageHeight = maxHeight * 0.5; // 60% of total height
            final textContainerHeight = maxHeight * 0.5; // 40% of total height
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image/background/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: imageHeight,
                    child: PageView(
                      children: [
                        Image.asset('assets/image/trainu1.png', fit: BoxFit.cover),
                        Image.asset('assets/image/trainu2.png', fit: BoxFit.cover),
                        // Image.asset('assets/image/example3.png', fit: BoxFit.cover),
                      ],
                    ),
                  ),
                  Container(
                    height: textContainerHeight,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.11),
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20), top: Radius.circular(20)),
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        r'Tại đây, khu giam trại nữ với diện tích 270 m2 bao gồm: 4 phòng giam nhỏ, phòng giam phụ nữ có con nhỏ, phòng giam tập thể, khu nhà tắm và sân trại, có thời kỳ thực dân Pháp đã giam tới 300 tù nhân nữ.' + '\n' +
                        r'Phòng giam chật hẹp, nước dùng trong sinh hoạt rất thiếu thốn, điều kiện vệ sinh không được đảm bảo cộng thêm khẩu phần ăn hằng ngày thường xuyên bị cắt xén khiến cuộc sống của nữ tù chính trị vô cùng cực khổ. Chế độ lao tù hà khắc đã cướp đi sinh mạng của nhiều chiến sỹ cộng sản kiên trung như đồng chí: Nguyễn Thị Quang Thái, Tạ Thị Câu, Đàm Thị Sen ...' + '\n' +
                            r'Vượt lên sự khắc nghiệt của cuộc sống tù đày, nữ tù chính trị Nhà tù Hỏa Lò đã đoàn kết, yêu thương, giúp đỡ nhau đấu tranh chống lại chế độ nhà tù hà khắc, tổ chức các lớp học chính trị, văn hóa, trau dồi kinh nghiệm đấu tranh, tiếp tục cống hiến sực lực của mình cho cách mạng.' + '\n' +
                            r'This is line 5.' + '\n' +
                            r'This is line 6.' + '\n' +
                            r'This is line 7.' + '\n' +
                            r'This is line 8.' + '\n' +
                            r'Line 9.' + '\n' +
                            r'Line 10.',
                          style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
                width: 30,
                height: 30,
                child: Icon(Icons.info_outline, color: Colors.black)
            ),
            label: 'Thông tin bổ sung',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 30,
              height: 30,
              child: Icon(Icons.play_circle_fill, color: Colors.black),
            ),
            label: 'Tư liệu lịch sử',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset('assets/icon/icon_ar.png'),
            ), // Set the desired width and height
            label: 'AR',
          ),
        ],
        unselectedItemColor: Color(0xFF6B6B6D),
        selectedItemColor: Color(0xFF6B6B6D),
        showUnselectedLabels: true,
        backgroundColor: Color(0xFFD5C5A9),
        selectedLabelStyle: TextStyle(fontSize: 14), // Set the desired font size for the selected label
        unselectedLabelStyle: TextStyle(fontSize: 14), // Set the desired font size for the unselected label
      ),
    );
  }
}

class AppBarTop2 extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarTop2({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: Color(0xFFD5C5A9),
      title: Text(
        title,
        style: GoogleFonts.openSans(
          color: Color(0xFF6B6B6D),
          fontWeight: FontWeight.w600,
          fontSize: screenWidth * 0.06,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Image.asset('assets/icon/icon_back.png', width: 30, height: 30),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
