import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding:  EdgeInsets.symmetric(vertical: 34),
          child: Text('Notification',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        ),
        const SizedBox(height: 20,),

        SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg'),
                      radius: 20,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('Joy Arnold left 6 comments on Your Post',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        SizedBox(height: 5,),
                        Text('yesterday at 11:15 AM',style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://api.time.com/wp-content/uploads/2017/12/terry-crews-person-of-year-2017-time-magazine-2.jpg?quality=85&w=2036'),
                      radius: 20,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Dennis Nedry commented on Isla Nublar SOC2 compliance report    ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,

                          ),

                        ),
                        SizedBox(height: 5,),
                        Text('yesterday at 11:15 AM',style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://engineering.unl.edu/images/staff/Kayla-Person.jpg'),
                      radius: 20,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('John Hammond created Isla Nublar SOC2 compliance report  kljgsljladjjafdskjljaljfdasljksaf ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,

                          ),

                        ),
                        SizedBox(height: 5,),
                        Text('yesterday at 11:15 AM',style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        )

      ],
    );
  }
}
