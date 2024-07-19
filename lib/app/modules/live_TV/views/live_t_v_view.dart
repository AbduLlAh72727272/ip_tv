import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/live_t_v_controller.dart';

class LiveTVView extends GetView<LiveTVController> {
  const LiveTVView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/image.png',
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Column(
            children: [
              // AppBar
              Container(
                color: Colors.black.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: PreferredSize(
                    preferredSize: Size.fromHeight(50.0), // Decrease the height of the AppBar
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 70, // Adjust the height of the back button
                          width: 50, // Adjust the width of the back button
                          child: IconButton(
                            icon: Image.asset('assets/images/back_button.png'),
                            onPressed: () => Get.back(),
                            iconSize: 20, // Adjust the size of the icon inside the button
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Live TV',
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          'Channel 01 HD',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.search, color: Colors.white),
                          onPressed: () {
                            // Handle search action
                          },
                          iconSize: 20, // Adjust the size of the search icon
                        ),
                        IconButton(
                          icon: Icon(Icons.settings, color: Colors.white),
                          onPressed: () {
                            // Handle settings action
                          },
                          iconSize: 20, // Adjust the size of the settings icon
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Main Body
              Expanded(
                child: Row(
                  children: [
                    // Left Sidebar
                    Container(
                      width: 180,
                      color: Colors.black.withOpacity(0.5),
                      child: ListView.builder(
                        itemCount: 10, // Update this with actual channel count
                        itemBuilder: (context, index) {
                          return Container(
                            color: index == 0 ? Colors.red : Colors.transparent,
                            child: ListTile(
                              title: Text(
                                'Channel 01 HD',
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                'Program Info',
                                style: TextStyle(color: Colors.white.withOpacity(0.7)),
                              ),
                              onTap: () {
                                // Handle channel selection
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    // Main Content
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(16.0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 7,
                        ),
                        itemCount: 12, // Update this with actual video count
                        itemBuilder: (context, index) {
                          return Image.asset(
                            'assets/images/sample.png', // Replace with actual video thumbnail
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
