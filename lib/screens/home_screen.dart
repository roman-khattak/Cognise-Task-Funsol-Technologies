import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/get_data_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * .01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: height * .04,
                      width: width * .3,
                      child: Image.asset(
                        'assets/images/logo.png',
                        // height: height * .05,
                        // width: width * .6,
                        scale: 7,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Image.asset(
                      'assets/images/pro_logo.png',
                    )
                  ],
                ),
                SizedBox(
                  height: height * .01,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                  'A painting of a woman with long hair, by Mandy Jurgens, charlie bowater at art style, charlie bowater rich deep colors, trending in art station'),
                            ),
                            Icon(Icons.cancel_presentation_outlined)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('150/1000'),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/bulb_icon.png',
                                  height: height * .04,
                                ),
                                Image.asset(
                                  'assets/images/mic_icon.png',
                                  height: height * .09,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/addpicicon.png',
                              height: height * .04,
                            ),
                            const Text('Add Image')
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * .03,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/ratiopicicon.png',
                              height: height * .04,
                            ),
                            const Text('1:1'),
                            const Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * .01,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('A painting of a woman with long hair,'),
                            Icon(Icons.cancel_presentation_outlined)
                          ],
                        ),
                        SizedBox(
                          height: height * .01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('150/500'),
                            Image.asset('assets/images/mic_icon.png'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .01,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Styles',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text('See all')
                  ],
                ),
            SizedBox(
              height: height * 0.15,
              width: double.infinity,
              child: Obx(
                    () => controller.isLoading.value ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        final item = controller.data[index];
                        return Container(
                          height: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Stack(
                            children: [
                              Image.network( // here we have used a base url and the api's response to display image
                                "https://mbl.downloadvid.app${item.icon}" ?? '',
                                width: 120,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 10,
                                left: 30,
                                child: Text(
                                  item.name ?? '',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),)
                            ],
                          ),
                        );
                      },
                    ),
              ),
            ),

                SizedBox(
                  height: height * .01,
                ),
                Container(
                  height: height * .1,
                  decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/images/filter.png',
                        ),
                        Text(
                          'Advance Settings',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text('optional'),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .03,
                ),
                Container(
                  height: height * .08,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xffE57750), Color(0xffDB2268)]),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/adlogo.png'),
                      SizedBox(
                        width: width * .02,
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Generate',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Watch an AD',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .01,
                ),
                const Text(
                  'Inspirations',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                SizedBox(
                  height: height * 0.3,
                  child: Obx(
                          () => controller.isLoading.value ? Center(child: CircularProgressIndicator(),)
                              : GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 9,
                              crossAxisSpacing: 9
                            ),
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) {
                              final item = controller.data[index];

                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.network(
                                  "https://mbl.downloadvid.app${item.icon}" ?? '',
                                  width: 100,
                                  height: 200,
                                  fit: BoxFit.cover, // To maintain aspect ratio and fill the container
                                ),
                              );
                            },
                          ),
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
