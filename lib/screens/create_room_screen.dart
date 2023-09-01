import 'package:flutter/material.dart';
import 'package:mp_tictactoe/resources/socket_method.dart';
import 'package:mp_tictactoe/responsive/responsive.dart';
import 'package:mp_tictactoe/widgets/custom_button.dart';
import 'package:mp_tictactoe/widgets/custom_text.dart';
import 'package:mp_tictactoe/widgets/custom_textfield.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../resources/socket_client.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/create-room';
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();
  final _socketClient = SocketClient.instance.socket!;
  IO.Socket? socket;

  @override
  void initState() {
    super.initState();
    connect();
    _socketMethods.createRoomSuccessListener(context);
  }

  void connect(){
    print('Line 18');
    _socketClient.emit("test", "Socket Connected");
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                  shadow: [Shadow(blurRadius: 40, color: Colors.blue)],
                  text: 'Create Room',
                  fontSize: 70
              ),
              SizedBox(height: size.height*0.08,),
              CustomTextField(
                controller : _nameController,
                  hintText: 'Enter your nickname',
              ),
              SizedBox(height: size.height*0.045,),
              CustomButton(title: 'Create', onPressed: () => _socketMethods.createRoom(_nameController.text)),
            ],
          ),
        ),
      ),
    );
  }
}
