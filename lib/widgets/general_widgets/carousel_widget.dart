import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    Key? key,
    required this.items,
    required this.size,
    required this.onTrainerSelected,
  }) : super(key: key);

  final List<dynamic> items;
  final Size size;
  final Function(dynamic) onTrainerSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onTrainerSelected(items[index]),
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.28,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              items[index].userImg,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              color: const Color(0xFF003153).withOpacity(0.2),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                        color: AppColors.primary.withOpacity(0.8),
                      ),
                      width: double.infinity,
                      height: size.height * 0.12,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Tooltip(
                                message: items[index].name +
                                    ' ' +
                                    items[index].surname,
                                child: Text(
                                  items[index].name +
                                      ' ' +
                                      items[index].surname,
                                  style: const TextStyle(
                                    color: AppColors.primaryWhite,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: AppColors.primaryWhite,
                                    size: 15,
                                  ),
                                  SizedBox(width: size.width * 0.01),
                                  Expanded(
                                    child: Text(
                                      items[index].address,
                                      style: const TextStyle(
                                        color: AppColors.primaryWhite,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height * 0.01),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.phone,
                                    color: Colors.yellow,
                                    size: 15,
                                  ),
                                  SizedBox(width: size.width * 0.01),
                                  Text(
                                    items[index].phoneNumber,
                                    style: const TextStyle(
                                      color: AppColors.primaryWhite,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
