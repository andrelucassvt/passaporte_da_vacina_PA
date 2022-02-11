import 'package:flutter/material.dart';

class NavigatorContainerView extends StatelessWidget {
  final Icon icon;
  final String title;
  final String? actionTitle;
  final String routNavigatorName;
  const NavigatorContainerView({ 
    Key? key, 
    required this.icon, 
    required this.title,
    required this.routNavigatorName,
    this.actionTitle, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10
      ),
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, routNavigatorName),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              children: [
                icon,
                const SizedBox(
                  width: 13,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800]
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        actionTitle ??'Clique aqui para continuar',
                        style: TextStyle(
                          color: Colors.grey[600]
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}