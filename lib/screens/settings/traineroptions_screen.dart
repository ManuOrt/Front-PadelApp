import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/general_widgets/textfield_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';

class TranierOptionsScreen extends StatefulWidget {
  const TranierOptionsScreen({super.key});

  @override
  State<TranierOptionsScreen> createState() => _TranierOptionsScreenState();
}

class _TranierOptionsScreenState extends State<TranierOptionsScreen> {
  TextEditingController? id;
  TextEditingController? titleController;
  GoogleMapController? locationController;
  List<int?> categories = [];
  TextEditingController? descriptionController;
  bool isSelected = false;
  List<bool> selectedCategories = [];
  static const LatLng defaultLocation = LatLng(39.5696, 2.6502);
  String? locationText;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (id == null) {
      final TrainerModel trainer =
          Provider.of<TrainersProvider>(context).trainer!;
      id = TextEditingController(text: trainer.id.toString());
      titleController = TextEditingController(text: trainer.title);
      locationText = trainer.location;
      List<int> trainerCategories = trainer.categories!;
      selectedCategories = List<bool>.filled(5, false);
      for (int category in trainerCategories) {
        selectedCategories[category - 1] = true;
      }
      descriptionController = TextEditingController(text: trainer.description);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TrainersProvider trainersProvider =
        Provider.of<TrainersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Opciones entrenador',
          style: TextStyle(color: AppColors.primaryWhite),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context, 'profile'),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.05, right: size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              const Text(
                'Titulo',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextFieldWidget(
                withSize: size.width * 0.9,
                controller: titleController!,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'El titulo no puede estar vacio';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const Text(
                'Descripción',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextFieldWidget(
                withSize: size.width * 0.9,
                controller: descriptionController!,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'La descripción no puede estar vacia';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const Text(
                'Categorias',
                style: TextStyle(
                    fontSize: 20,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Wrap(
                spacing: size.aspectRatio * 70,
                children: [
                  for (int i = 0; i < 5; i++)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategories[i] = !selectedCategories[i];
                        });
                      },
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: selectedCategories[i]
                              ? AppColors.primary
                              : Colors.white,
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(color: AppColors.primary),
                        ),
                        child: Center(
                          child: Text(
                            '${i + 1}',
                            style: TextStyle(
                                fontSize: 16,
                                color: selectedCategories[i]
                                    ? Colors.white
                                    : AppColors.primary),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const Text(
                'Ubicación',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                height: size.height * 0.3,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _locationFromText(locationText!) ?? defaultLocation,
                    zoom: 15,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    locationController = controller;
                  },
                  markers: {
                    Marker(
                      markerId: const MarkerId('1'),
                      position:
                          _locationFromText(locationText!) ?? defaultLocation,
                    ),
                  },
                  onTap: (LatLng location) {
                    setState(() {
                      locationText =
                          '${location.latitude},${location.longitude}';
                    });
                    locationController!.animateCamera(
                      CameraUpdate.newLatLng(location),
                    );
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    final TrainerModel? trainer = trainersProvider.trainer;
                    if (trainer != null) {
                      final updateTrainer = trainer.copyWith(
                        title: titleController!.text,
                        description: descriptionController!.text,
                        location: locationText,
                        categories: [
                          for (int i = 0; i < 5; i++)
                            if (selectedCategories[i]) i + 1
                        ],
                      );
                      trainersProvider.updateTrainer(
                          updateTrainer,
                          Provider.of<AuthProvider>(context, listen: false)
                              .getToken()!);
                      Navigator.pop(context, 'profile');
                    }
                  },
                  child: const Text(
                    'Guardar',
                    style: TextStyle(
                      color: AppColors.primaryWhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  LatLng? _locationFromText(String text) {
    List<String> parts = text.split(',');
    if (parts.length != 2) return null;
    double? latitude = double.tryParse(parts[0]);
    double? longitude = double.tryParse(parts[1]);
    if (latitude == null || longitude == null) return null;
    return LatLng(latitude, longitude);
  }
}
