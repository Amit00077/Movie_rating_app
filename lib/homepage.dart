import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_rating_app/bloc/home_bloc/home_page_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<HomePageBloc>(context).add(HomePageInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic width = MediaQuery.of(context).size.width;
    final dynamic height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text("Movies Adda")),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          if (state is HomePageLoaded) {
            return ListView.builder(
                itemCount: state.moviesModel.result!.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.keyboard_arrow_up,
                                size: width * 0.15,
                              ),
                              Text(
                                state.moviesModel.result![index].totalVoted
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: width * 0.1),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: width * 0.15,
                              ),
                            ],
                          ),
                          Container(
                            height: height * 0.18,
                            width: width * 0.25,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Image.network(
                                state.moviesModel.result![index].poster),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.moviesModel.result![index].title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: height * 0.035,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 36),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Genre:',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: height * 0.025,
                                              fontWeight: FontWeight.w700,
                                              overflow: TextOverflow.ellipsis)),
                                      TextSpan(
                                          text: state
                                              .moviesModel.result![index].genre,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: height * 0.025,
                                              fontWeight: FontWeight.w400,
                                              overflow: TextOverflow.ellipsis))
                                    ],
                                  ),
                                ),
                                RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 36),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Director:',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: height * 0.025,
                                              fontWeight: FontWeight.w600)),
                                      TextSpan(
                                          text: state.moviesModel.result![index]
                                              .director[0],
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: height * 0.025,
                                              fontWeight: FontWeight.w400,
                                              overflow: TextOverflow.ellipsis))
                                    ],
                                  ),
                                ),
                                RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 36),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Starring:',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: height * 0.025,
                                              fontWeight: FontWeight.w600)),
                                      TextSpan(
                                          text: state.moviesModel.result![index]
                                              .stars[0],
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: height * 0.025,
                                              fontWeight: FontWeight.w400,
                                              overflow: TextOverflow.ellipsis))
                                    ],
                                  ),
                                ),
                                Text(
                                  "${state.moviesModel.result![index].pageViews} views | voted by ${state.moviesModel.result![index].totalVoted} people",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: height * 0.015),
                                    child: Text(
                                      "Watch Trailer",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: width * 0.04,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Company Info',
                  style: TextStyle(
                      fontSize: height * 0.04,
                      color: Colors.white,
                      fontWeight: FontWeight.w400)),
            ),
            RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 36),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Company: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: height * 0.025,
                          fontWeight: FontWeight.w600)),
                  TextSpan(
                      text: "Geeksynergy\nTechnologies Pvt Ltd",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: height * 0.025,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis))
                ],
              ),
            ),
            SizedBox(height: height*0.02,),
            RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 36),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Address: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: height * 0.025,
                          fontWeight: FontWeight.w600)),
                  TextSpan(
                      text: "sanjayanagar,\n Bengaluru-56",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: height * 0.025,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis))
                ],
              ),
            ),
            SizedBox(height: height*0.02,),

            RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 36),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Phone No.: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: height * 0.025,
                          fontWeight: FontWeight.w600)),
                  TextSpan(
                      text: "XXXXXX4545",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: height * 0.025,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis))
                ],
              ),
            ),
            SizedBox(height: height*0.02,),

            RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 36),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Email.: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: height * 0.025,
                          fontWeight: FontWeight.w600)),
                  TextSpan(
                      text: "XXXXXX@gmail.com",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: height * 0.025,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis))
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
