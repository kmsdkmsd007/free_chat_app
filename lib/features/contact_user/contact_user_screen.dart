import 'package:chat_app/features/contact_user/contact_user%20bloc/contact_user_bloc.dart';
import 'package:chat_app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactuserScreen extends StatelessWidget {
  const ContactuserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("User in your contact list"),
      ),
      body: BlocBuilder<ContactUserBloc, ContactUserState>(
          builder: (context, state) {
        return state is ContactUserLoading
            ? Center(child: CircularProgressIndicator())
            : state is ContactUserError
                ? Center(
                    child: Text('Something went wrong'),
                  )
                : state is ContactUserLoaded
                    ? Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search here...",
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.users.length,
                              itemBuilder: (context, index) {
                                print(state.users.length.toString());
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 25),
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          Routes.conversation,
                                          arguments: {
                                            'user_Id':
                                                state.users[index].userId,
                                            'name': state.users[index].username
                                          });
                                    },
                                    leading: CircleAvatar(
                                      radius: 30,
                                      foregroundImage: NetworkImage(
                                        state.users[index].profilePicture
                                                .isNotEmpty
                                            ? state.users[index].profilePicture
                                            : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                                      ),
                                    ),
                                    title: Text(
                                      state.users[index].username,
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(state.users[index].email,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    trailing: Text(state.users[index].createdAt
                                        .toString()),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : Container();
      }),
    );
  }
}
