import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_sign/Models/channel_model.dart';
import 'package:true_sign/Models/video_model.dart';
import 'package:true_sign/Screens/video_screen.dart';
import 'package:true_sign/Services/api_service.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({Key? key}) : super(key: key);

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  Channel? _channel;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await ApiService.instance.fetchChannel(channelId: 'UCUNrkuLWcTq3YUKWEWZz-pw');
    setState(() {
      _channel = channel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _channel != null ? ListView.builder(
        itemCount: 1 + _channel!.videos!.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return _buildprofileInfo();
          }
          Video video = _channel!.videos![index - 1];
          return _buildVideo(video);
        },
      ) :
          Center(
            child: CircularProgressIndicator(
              color: Color(0xFF034582),
            ),
          )
    );
  }

  _buildprofileInfo() {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      height: 100,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 1),
          blurRadius: 0.6,
        )
      ]),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30.0,
            backgroundImage: NetworkImage(_channel!.profilePictureUrl),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _channel!.title,
                style: GoogleFonts.poppins(fontSize: 18, color: const Color(0xFF034582)),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${_channel!.SubscriberCount} Subscribers',
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => VideoScreen(id: video.id))),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: const EdgeInsets.all(10.0),
        height: 140.0,
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 0.6,
          ),
        ]),
        child: Row(
          children: <Widget>[
            Image(
              width: 150.0,
              image: NetworkImage(video.thumbnailUrl),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                video.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
