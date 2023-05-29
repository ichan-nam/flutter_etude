import 'package:flutter/material.dart';
import 'package:flutter_etude/extensions/color_extension.dart';
import 'package:flutter_etude/models/user_model.dart';
import 'package:flutter_etude/services/api_service.dart';
import 'package:flutter_etude/services/database_service.dart';
import 'package:flutter_etude/utils/flag_util.dart';
import 'package:flutter_etude/widgets/contents_container_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required UserModel user,
  }) : _user = user;

  final UserModel _user;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final DatabaseService databaseService = DatabaseService();
  bool isLiked = false;

  void initIsLiked() async {
    UserModel? user =
        await databaseService.selectFavorite(widget._user.login.uuid);
    setState(() {
      isLiked = (user != null);
    });
  }

  @override
  void initState() {
    super.initState();
    initIsLiked();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._user.name.last),
        actions: [
          IconButton(
            onPressed: onHeartTap,
            icon: Icon(
              Icons.favorite,
              color: isLiked ? CustomColors.customPink3 : Colors.grey,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              pictureBuilder(),
              nameBuilder(),
              const SizedBox(
                height: 16,
              ),
              genderAgeNationalityBuilder(),
              const SizedBox(
                height: 32,
              ),
              detailInfoList(),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  void onHeartTap() {
    if (isLiked) {
      databaseService.deleteFavorite(widget._user.login.uuid);
    } else {
      databaseService.insertFavorite(widget._user);
    }

    setState(() {
      isLiked = !isLiked;
    });
  }

  void onUrlTap() async {
    Uri url = Uri.parse(
        'https://github.com/timo-nam/flutter_etude/blob/main/README.md');

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  ContentsContainer detailInfoList() {
    final contents = <String, String>{
      'Cell': widget._user.cell,
      'Email': widget._user.email,
      'Blog': 'https://virtualfriends.com/blog/${widget._user.login.username}',
      'Birth': widget._user.dob.date.substring(0, 10),
      'Postcode': widget._user.location.postcode,
      'Street':
          '${widget._user.location.street.number}, ${widget._user.location.street.name}',
      'Address':
          '${widget._user.location.city}, ${widget._user.location.state}',
      'Time Zone':
          '(${widget._user.location.timezone.offset}) ${widget._user.location.timezone.description}',
    };

    final List<Widget> widgetList =
        contents.entries.fold([], (previousValue, element) {
      previousValue.add(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            element.key,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 4,
          ),
          SelectableText(
            element.value,
            style: const TextStyle(
              fontSize: 16,
            ),
            onTap: element.key == 'Blog' ? onUrlTap : null,
          ),
        ],
      ));
      previousValue.add(
        const Column(children: [
          SizedBox(
            height: 4,
          ),
          Divider(),
          SizedBox(
            height: 4,
          ),
        ]),
      );
      return previousValue;
    });

    widgetList.removeLast();

    return ContentsContainer(
      shadowColor: CustomColors.customPink1,
      padding: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgetList,
      ),
    );
  }

  Widget genderAgeNationalityBuilder() {
    return ContentsContainer(
      shadowColor: CustomColors.customPink1,
      padding: 8,
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Icon(
                size: 32,
                widget._user.gender == GenderEnum.male.toString()
                    ? Icons.male
                    : Icons.female,
                color: widget._user.gender == GenderEnum.male.toString()
                    ? CustomColors.customDarkBlue
                    : CustomColors.customRed,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                '${widget._user.dob.age}y',
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                FlagUtil.getFlagByNationality(widget._user.nat),
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Center nameBuilder() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
            offset: const Offset(2, 8),
            child: Text(
              widget._user.name.first,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            widget._user.name.last,
            style: const TextStyle(
              color: CustomColors.customWhite,
              fontSize: 48,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Hero pictureBuilder() {
    return Hero(
      tag: widget._user.login.uuid,
      child: CircleAvatar(
        backgroundColor: CustomColors.customPink1,
        backgroundImage: NetworkImage(widget._user.picture.large),
        maxRadius: 128,
      ),
    );
  }
}
