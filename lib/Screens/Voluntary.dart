import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageCard {
  final String imageUrl;
  final String description;

  ImageCard({required this.imageUrl, required this.description});
}

abstract class VoluntaryEvent {}

class LoadVoluntaryEvent extends VoluntaryEvent {}

abstract class VoluntaryState {}

class VoluntaryInitialState extends VoluntaryState {}

class VoluntaryLoadedState extends VoluntaryState {
  final List<ImageCard> imageCards;

  VoluntaryLoadedState({required this.imageCards});
}

class VoluntaryBloc extends Bloc<VoluntaryEvent, VoluntaryState> {
  VoluntaryBloc() : super(VoluntaryInitialState());

  @override
  Stream<VoluntaryState> mapEventToState(VoluntaryEvent event) async* {
    if (event is LoadVoluntaryEvent) {
      yield VoluntaryLoadedState(
        imageCards: [
          ImageCard(
            imageUrl:
                'https://www.nashvillesmls.com/uploads/agent-1/home-being-built.jpg',
            description: 'Description 1',
          ),
          ImageCard(
            imageUrl:
                'https://govolunteeringabroad.com/wp-content/uploads/2019/10/medical5.jpg',
            description: 'Description 2',
          ),
          ImageCard(
            imageUrl:
                'https://www.volunteerhq.org/images/projects/south-africa/volunteer-abroad-in-south-africa-ivhq-cape-town-childcare.jpg',
            description: 'Description 3',
          ),
          ImageCard(
            imageUrl: 'https://i.ytimg.com/vi/4Ry0OU08p4Y/maxresdefault.jpg',
            description: 'Description 4',
          ),
        ],
      );
    }
  }
}

class VoluntaryScreen extends StatelessWidget {
  final VoluntaryBloc voluntaryBloc;

  const VoluntaryScreen({super.key, required this.voluntaryBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Cards'),
        backgroundColor: Colors.lightBlue,
      ),
      body: BlocBuilder<VoluntaryBloc, VoluntaryState>(
        bloc: voluntaryBloc,
        builder: (context, state) {
          if (state is VoluntaryLoadedState) {
            return ListView.builder(
              itemCount: state.imageCards.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          imageUrl: state.imageCards[index].imageUrl,
                          description: state.imageCards[index].description,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  state.imageCards[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            state.imageCards[index].description,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String imageUrl;
  final String description;

  const DetailScreen(
      {Key? key, required this.imageUrl, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  'Detail Screen',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Lorem ipsum dolor sitamet, consectetur adipiscing elit. Nullam in velit eget urna facilisis ultrices et sed erat. Morbi a est lectus. Integer euismod, lacus ut faucibus tristique, mi quam laoreet libero, eu hendrerit odio justo eget lacus. Donec ornare enim a nisi convallis, vel tristique quam faucibus. Sed at sapien ut nisl facilisis feugiat. Nam eu lorem id turpis congue ullamcorper. Ut pharetra massa non ipsum varius, non rhoncus justo iaculis. Integer non nunc in mauris interdum egestas vel sit amet velit. Sed eget lorem a erat blandit suscipit non non purus. Sed vel consectetur massa. Ut et tellus malesuada, bibendum felis vitae, feugiat lectus. Nullam feugiat dolor et augue euismod, id sollicitudin magna aliquam. Integer scelerisque risus vel turpis pretium aliquet. Ut sodales eros vitae felis fringilla, a semper arcu gravida. ',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: Container(
                                height: 300,
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const Text(
                                      'Contact Seller',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Name',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const TextField(
                                      maxLines: 4,
                                      decoration: InputDecoration(
                                        labelText: 'Message',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text('Message sent'),
                                          ),
                                        );
                                      },
                                      child: const Text('Submit'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      child: const Text(
                        'Contact Seller',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
