import 'package:flutter/material.dart';

class InputWidgetCustom extends StatelessWidget {
  final String judulField;
  final Icon iconField;
  final String hintfield;
  final bool terlihat;
  final TextEditingController controller;
  const InputWidgetCustom({
    required this.hintfield,
    required this.iconField,
    required this.judulField,
    required this.terlihat,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.055,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Text(
                    judulField,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                controller: controller,
                obscureText: terlihat,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    focusColor: Colors.black,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    prefixIconColor: Colors.black,
                    prefixIcon: iconField,
                    hintText: hintfield,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
